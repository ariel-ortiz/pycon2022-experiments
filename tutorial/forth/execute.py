#!/usr/bin/env python

# Generic WASM execution script.
# Copyright (C) 2022 Ariel Ortiz
#
# To run, at the terminal type:
#
#     python execute.py input_file.wasm

from sys import argv, stdin, stderr, exit
from wasmer import engine, Module, Store, Instance, ImportObject, Function
from wasmer_compiler_cranelift import Compiler


def make_import_object(store):

    #----------------------------------------------------------------
    # Functions to be imported from the Wasm module

    def _print(x: int):
        print(f'{x} ', end='')

    def _emit(x: int):
        print(chr(x), end='')

    #----------------------------------------------------------------

    import_object = ImportObject()

    import_object.register(
        "forth",
        {
            "print": Function(store, _print),
            "emit": Function(store, _emit)
        }
    )

    return import_object


def create_instance(file_name):
    store = Store(engine.JIT(Compiler))
    with open(file_name, 'rb') as file:
        return Instance(Module(store, file.read()),
                        make_import_object(store))


def check_args():
    if len(argv) != 2:
        print('Please specify the name of the WASM binary file.', file=stderr)
        exit(1)


def main():
    check_args()
    instance = create_instance(argv[1])
    instance.exports.main()

main()
