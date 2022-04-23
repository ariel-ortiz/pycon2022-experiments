#!/usr/bin/env python

from os.path import splitext
from sys import argv, stderr, exit
from wasmer import wat2wasm

WAT_SOURCE_BEGIN = ''';; chiqui_forth compiler WAT output

(module
  (import "forth" "emit" (func $emit (param i32)))
  (import "forth" "input" (func $input (result i32)))
  (import "forth" "print" (func $print (param i32)))
  (func (export "_start")'''

WAT_SOURCE_END = '''  )
)'''

OPERATION = {
    '+': ['i32.add'],
    '-': ['i32.sub'],
    '*': ['i32.mul'],
    '/': ['i32.div_s'],
    '.': ['call $print'],
    'input': ['call $input'],
    '=': ['i32.eq'],
    '<>': ['i32.ne'],
    '<': ['i32.lt_s'],
    '<=': ['i32.le_s'],
    '>': ['i32.gt_s'],
    '>=': ['i32.ge_s'],
    'and': ['i32.and'],
    'or': ['i32.or'],
    'not': ['i32.eqz'],
    'drop': ['drop'],
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


def read_words(input_file_name):
    try:
        with open(argv[1]) as source_file:
            source_text = source_file.read()
        return source_text.split()
    except FileNotFoundError:
        print(f'Oops! File not found: {input_file_name}', file=stderr)
        exit(1)


def remove_comments(words):
    commentless_words = []
    inside_comment = False
    for word in words:
        if inside_comment:
            if word == ')':
                inside_comment = False
        elif word == '(':
            inside_comment = True
        else:
            commentless_words.append(word)
    return commentless_words


def is_var_name(word):
    return (word[0].isalpha()
        and word.isalnum()
        and word not in OPERATION)


def find_vars_used(words):
    names = set()
    for word in words:
        name = word[:-1] if word[-1] == '!' else word
        if is_var_name(name):
            names.add(name)
    return names


def declare_vars(result, vars):
    for var in vars:
        result.append(INDENTATION + f'(local ${var} i32)')


def code_generation(result, words):
    for word in words:
        if word.isdigit():
            result.append(INDENTATION + f'i32.const {word}')
        elif word in OPERATION:
            for statement in OPERATION[word]:
                result.append(INDENTATION + statement)
        elif is_var_name(word):
            result.append(INDENTATION + f'local.get ${word}')
        elif word[-1] == '!' and is_var_name(word[:-1]):
            result.append(INDENTATION + f'local.set ${word[:-1]}')
        else:
            raise ValueError(f"'{word}' is not a valid word")

def create_wat_file(file_name, file_content):
    with open(file_name + '.wat', 'w') as file:
        file.write(file_content)


def create_wasm_file(file_name, file_content):
    with open(file_name + '.wasm', 'wb') as file:
        file.write(wat2wasm(file_content))


def main():
    check_args()
    full_source_name = argv[1]
    words = read_words(full_source_name)
    words = remove_comments(words)
    result = []
    result.append(WAT_SOURCE_BEGIN)
    declare_vars(result, find_vars_used(words))
    code_generation(result, words)
    result.append(WAT_SOURCE_END)
    file_name, extension = splitext(full_source_name)
    file_content = '\n'.join(result)
    create_wat_file(file_name, file_content)
    create_wasm_file(file_name, file_content)


if __name__ == '__main__':
    main()
