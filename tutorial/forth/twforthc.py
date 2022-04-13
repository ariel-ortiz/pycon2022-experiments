from sys import argv, stderr, exit

result = []

head = ''';; TeenyWeenyForth compiler WAT output
(module
  (import "twforth" "print" (func $print (param i32)))
  (import "twforth" "emit" (func $emit (param i32)))
  (func $main
    (export "main")
    (local $_tmp1 i32)
    (local $_tmp2 i32)'''

tail = '''  )
)'''

operation = {
    '+': ['i32.add'],
    '-': ['i32.sub'],
    '*': ['i32.mul'],
    '/': ['i32.div_s'],
    '.': ['call $print'],
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
    '[': [
        'block $break',
        'loop $top',
    ],
    '?': [
        'i32.eqz',
        'br_if $break'
    ],
    ']': [
        'br $top',
        'end ;; loop',
        'end ;; block'
    ]
}

operation_names = list(operation.keys())

indent = '    '

if len(argv) != 2:
    print('Please provide the name of the TeenyWeenyForth source file.')
    exit(1)

with open(argv[1]) as source_file:
    source_text = source_file.read()

tokens = source_text.split()

# check for variable usage
varnames = set()

def is_variable_name(s):
    return (s[0].isalpha()
        and s.isalnum()
        and s not in operation_names)

for token in tokens:
    s = token[1:] if token[0] == '!' else token
    if is_variable_name(s):
        varnames.add(s)

result.append(head)

for varname in varnames:
    result.append(indent + f'(local ${varname} i32)')

for token in tokens:
    if token.isdigit():
        result.append(indent + f'i32.const {token}')
    elif token in operation_names:
        for statement in operation[token]:
            result.append(indent + statement)
    elif is_variable_name(token):
        result.append(indent + f'local.get ${token}')
    elif token[0] == '!' and is_variable_name(token[1:]):
        result.append(indent + f'local.set ${token[1:]}')
    else:
        raise ValueError(f"'{token}' is not a valid word")

result.append(tail)

print('\n'.join(result))
