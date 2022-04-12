#!/usr/bin/env python

# Generic Wat execution script.
# Copyright (C) 2021 Ariel Ortiz, ITESM CEM
#
# To run, at the terminal type:
#
#     python execute.py input_file.wat

from sys import argv
from wasmer import engine, Module, wat2wasm, Store, Instance
from wasmer_compiler_cranelift import Compiler

def create_instance(file_name):
    with open(file_name, 'rb') as wasm_file:
        return Instance(Module(Store(engine.JIT(Compiler)),
                               wasm_file.read()))

def main():

    if len(argv) != 2:
        raise SystemExit('Please specify the name of the input Wasm file.')

    instance = create_instance(argv[1])

    # Run exported function, print result
    print(instance.exports.duplicate(21))
    print(instance.exports.f2c(212.0))
    print(instance.exports.f2c(32.0))
    print(instance.exports.f2c(-40.0))
    print(instance.exports.root(2.0, 4.0, 2.0))
    print(instance.exports.root(1.0, 1.0, 0.0))
    print(instance.exports.root(4.0, 5.0, 1.0))

    instance.exports.test_memory()

    the_memory = instance.exports.the_memory
    the_buffer = bytearray(the_memory.buffer)
    # the_string = the_buffer[0:10].decode()
    the_list = the_buffer[0:10]
    for i in the_list:
        print(f'{i}', end=' ')
    print()

main()
