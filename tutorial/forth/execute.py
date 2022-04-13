#!/usr/bin/env python

# Generic Wat execution script.
# Copyright (C) 2021 Ariel Ortiz, ITESM CEM
#
# To run, at the terminal type:
#
#     python execute.py input_file.wat

from sys import argv, stdin, stderr, exit
from wasmer import engine, Module, wat2wasm, Store, Instance
from wasmer_compiler_cranelift import Compiler

from wasmer import ImportObject, Function

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
        "twforth",
        {
            "print": Function(store, _print),
            "emit": Function(store, _emit)
        }
    )

    return import_object


def create_instance(file_name):
    with open(file_name) as wat_file:
        return Instance(Module(Store(engine.JIT(Compiler)),
                               wat2wasm(wat_file.read())))

def main():

    if len(argv) != 2:
        print('Please specify the name of the input WAT file.', file=stderr)
        exit(1)

     # Create a store
    store = Store(engine.JIT(Compiler))

    # Convert Wat file contents into Wasm binary code
    wat_file_name = argv[1]
    with open(wat_file_name) as wat_file:
        wat_source_code = wat_file.read()
    wasm_bytes = wat2wasm(wat_source_code)

    # Compile the Wasm module
    module = Module(store, wasm_bytes)

    # Obtain functions to be imported from the Wasm module
    import_object = make_import_object(store)

    # Instantiate the module
    instance = Instance(module, import_object)

    # Run start function
    instance.exports.main()

main()
