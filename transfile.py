from qiskit_qasm3_import import parse, ConversionError
from qiskit_qasm3_import.expression import is_physical
from qiskit_qasm3_import.converter import ConvertVisitor
import openqasm3

from qiskit import QuantumCircuit
from qiskit.circuit import Qubit

def readfile(fname):
    with open(fname, "r") as fh:
        program = fh.read()
    return program

def parsefile(fname):
    ast, state = parsetostate(fname)
    return ast, state.circuit

def parsetostate(fname):
    program = readfile(fname)
    ast = openqasm3.parse(program)
    state = ConvertVisitor().convert(ast)
    return ast, state
