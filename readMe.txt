#This repo contains files regarding the Hints topic and Program input & output.

Hints
A hint is a piece of python code, which contains instructions that only the prover sees and executes. From the point of view of the verifier these hints do not exist.

Program input
Adding program input to a Cairo program is easy – you create a json file with your program input, and pass it to cairo-run using the --program_input flag. Then you can use hints to access the content of this file using the variable program_input (recall that hints are only visible to the prover).
see prog_input_output.cairo as example.


