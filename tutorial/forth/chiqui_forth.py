#!/usr/bin/env python

from os.path import splitext
from sys import argv, stderr, exit
from wasmer import wat2wasm

WAT_SOURCE_BEGIN = ''';; chiqui_forth compiler WAT output

(module
  (import "forth" "print" (func $print (param i32)))
  (import "forth" "emit" (func $emit (param i32)))
  (func $main
    (export "main")
    (local $_tmp1 i32)
    (local $_tmp2 i32)'''

WAT_SOURCE_END = '''  )
)'''

OPERATION = {
    '+': ['i32.add'],
    '-': ['i32.sub'],
    '*': ['i32.mul'],
    '/': ['i32.div_s'],
    '.': ['call $print'],
    '=': ['i32.eq'],
    '<>': ['i32.ne'],
    '<': ['i32.lt_s'],
    '<=': ['i32.le_s'],
    '>': ['i32.gt_s'],
    '>=': ['i32.ge_s'],
    'and': ['i32.and'],
    'or': ['i32.or'],
    'not': ['i32.eqz'],
    'dup': [
        'local.set $_tmp1',
        'local.get $_tmp1',
        'local.get $_tmp1'
    ],
    'drop': ['drop'],
    'swap': [
        'local.set $_tmp1',
        'local.set $_tmp2',
        'local.get $_tmp1',
        'local.get $_tmp2'
    ],
    'emit': ['call $emit'],
    'cr': [
        'i32.const 10',
        'call $emit'
    ],
    'bl': [
        'i32.const 32',
        'call $emit'
    ],
    'do': [
        'block',
        'loop',
    ],
    '?': [
        'i32.eqz',
        'br_if 1'
    ],
    'loop': [
        'br 0',
        'end ;; loop',
        'end ;; block'
    ]
}

INDENTATION = '    '

def check_args():
    if len(argv) != 2:
        print('Please specify the name of the Forth source file.', file=stderr)
        exit(1)


def read_tokens(input_file_name):
    try:
        with open(argv[1]) as source_file:
            source_text = source_file.read()
        return source_text.split()
    except FileNotFoundError:
        print(f'Oops! File not found: {input_file_name}', file=stderr)
        exit(1)


def remove_comments(tokens):
    commentless_tokens = []
    inside_comment = False
    for token in tokens:
        if inside_comment:
            if token == ')':
                inside_comment = False
        elif token == '(':
            inside_comment = True
        else:
            commentless_tokens.append(token)
    return commentless_tokens


def is_var_name(token):
    return (token[0].isalpha()
        and token.isalnum()
        and token not in OPERATION)


def find_vars_used(tokens):
    names = set()
    for token in tokens:
        name = token[:-1] if token[-1] == '!' else token
        if is_var_name(name):
            names.add(name)
    return names


def declare_vars(result, vars):
    for var in vars:
        result.append(INDENTATION + f'(local ${var} i32)')


def code_generation(result, tokens):
    for token in tokens:
        if token.isdigit():
            result.append(INDENTATION + f'i32.const {token}')
        elif token in OPERATION:
            for statement in OPERATION[token]:
                result.append(INDENTATION + statement)
        elif is_var_name(token):
            result.append(INDENTATION + f'local.get ${token}')
        elif token[-1] == '!' and is_var_name(token[:-1]):
            result.append(INDENTATION + f'local.set ${token[:-1]}')
        else:
            raise ValueError(f"'{token}' is not a valid word")

def create_wat_file(file_name, file_content):
    with open(file_name + '.wat', 'w') as file:
        file.write(file_content)


def create_wasm_file(file_name, file_content):
    with open(file_name + '.wasm', 'wb') as file:
        file.write(wat2wasm(file_content))


def main():
    check_args()
    full_source_name = argv[1]
    tokens = read_tokens(full_source_name)
    tokens = remove_comments(tokens)
    result = []
    result.append(WAT_SOURCE_BEGIN)
    declare_vars(result, find_vars_used(tokens))
    code_generation(result, tokens)
    result.append(WAT_SOURCE_END)
    file_name, extension = splitext(full_source_name)
    file_content = '\n'.join(result)
    create_wat_file(file_name, file_content)
    create_wasm_file(file_name, file_content)


if __name__ == '__main__':
    main()
