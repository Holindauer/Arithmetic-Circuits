# Arithmetic Circuit Proofs

This repository contains explorations of proofs of arithmetic circuits w/ Circom (a ZK programming langauge).

An arithmetic circuit defines a set of contraints for a some input parameters. A given set of input parameters is called the witness. If the witness resolves the circuit as true, the witness is a valid solution to the circuit. 

The following examples are included:

[multiplier](multiplier/Multiplier2.circom) -- a simple "hello world" circuit that multiplies two numbers

[Australia 3-coloring](australiaThreeColoring/AustraliaColoring.circom) -- a circuit that checks if a given graph can be colored with 3 colors

[Sorted List](sortedList/sortedList.circom) -- binary encoded GTE() template used for checking subsequent list terms 

Most ideas for examples from this repo came from: https://www.rareskills.io/post/arithmetic-circuit


Dependencies:

    npm install -g circom
    npm install -g snarkjs
