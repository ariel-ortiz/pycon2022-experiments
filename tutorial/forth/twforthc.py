from sys import argv, stderr, exit

result = []

head = ''';; TeenyWeenyForth compiler WAT output
(module
  (import "twforth" "print" (func $print (param i32)))
  (import "twforth" "emit" (func $emit (param i32)))
  (func $main
    (export "main")
    (local $tmp1 i32)
    (local $tmp2 i32)'''

tail = '''  )
)'''

operation = {
    '+': ['i32.add'],
    '-': ['i32.sub'],
    '*': ['i32.mul'],
    '/': ['i32.div_s'],
    '.': ['call $print'],
    'dup': [
        'local.set $tmp1',
        'local.get $tmp1',
        'local.get $tmp1'
    ],
    'drop': ['drop'],
    'swap': [
        'local.set $tmp1',
        'local.set $tmp2',
        'local.get $tmp1',
        'local.get $tmp2'
    ],
    'emit': ['call $emit'],
    'cr': [
        'i32.const 10',
        'call $emit'
    ],
    'loop': [
        'block $break',
        'loop $top',
        'i32.eqz',
        'br_if $break'
    ],
    'end': [
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

result.append(head)

for token in tokens:
    if token.isdigit():
        result.append(indent + f'i32.const {token}')
    elif token in operation_names:
        for statement in operation[token]:
            result.append(indent + statement)
    else:
        raise ValueError(f"'{token}' is not a valid word")

result.append(tail)

print('\n'.join(result))
