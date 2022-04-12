# Bf compiler.

from sys import argv, stderr, exit

if len(argv) != 2:
    print('Please provide the name of the Bf source file.')
    exit(1)

with open(argv[1]) as source_file:
    source_text = source_file.read()

head = '''
(module

  (import "bf" "putchar" (func $putchar (param i32)))
  (import "bf" "getchar" (func $getchar (result i32)))
  (memory 1)

  (func $main
    (export "main")
    (local $ptr i32)
'''

tail = '''
  )
)
'''

operator = {
    '>':
'''
    ;; Operator <
    local.get $ptr
    i32.const 1
    i32.add
    local.set $ptr
''',
    '<':
'''
    ;; Operator >
    local.get $ptr
    i32.const 1
    i32.sub
    local.set $ptr
''',
    '+':
'''
    ;; Operator +
    local.get $ptr
    local.get $ptr
    i32.load8_u
    i32.const 1
    i32.add
    i32.store8
''',
    '-':
'''
    ;; Operator -
    local.get $ptr
    local.get $ptr
    i32.load8_u
    i32.const 1
    i32.sub
    i32.store8
''',
    '.':
'''
    ;; Operator .
    local.get $ptr
    i32.load8_u
    call $putchar
''',
    ',':
'''
    ;; Operator ,
    local.get $ptr
    call $getchar
    i32.store8
''',
    '[':
'''
    ;; Operator [
    block $break_{0}
    loop $top_{0}
    local.get $ptr
    i32.load8_u
    i32.eqz
    br_if $break_{0}
''',
    ']':
'''
    ;; Operator ]
    br $top_{0}
    end ;; $top_{0}
    end ;; $break_{0}
'''
}

result = []

result.append(head)

counter = 0

for c in source_text:
    if c in operator:
        if c == '[':
            result.append(operator[c].format(counter))
            counter += 1
        elif c == ']':
            counter -= 1
            result.append(operator[c].format(counter))
        else:
            result.append(operator[c])

result.append(tail)

print(''.join(result))
