# Materials from Demo Day Presentation, March 9, 2023

The topic was [*physical qubit support in qiskit-qasm3-import*](https://github.com/Qiskit/qiskit-qasm3-import/pull/2).


Here is an example similar to those in the video.

```python
In [1]: from transfile import parsefile, parsetostate

In [2]: ast, state = parsetostate("qasm_files/simp_hw.qasm")

In [3]: print(state.circuit)
  ┌───┐     
0 ┤ H ├──■──
  └───┘┌─┴─┐
1 ─────┤ X ├
       └───┘

In [4]: state.addressing_mode
Out[4]: AddressingMode(_Mode.PHYSICAL)

In [5]: state.circuit._layout
Out[5]: 
TranspileLayout(initial_layout=Layout({
0: <qiskit.circuit.quantumregister.Qubit object at 0x7ff7074fbd80>,
1: <qiskit.circuit.quantumregister.Qubit object at 0x7ff707500100>
}), input_qubit_mapping={<qiskit.circuit.quantumregister.Qubit object at 0x7ff7074fbd80>: 0, <qiskit.circuit.quantumregister.Qubit object at 0x7ff707500100>: 1}, final_layout=None)
```



