This repo contains files regarding the Hints topic and Program input & output.

# Hints
A hint is a piece of python code, which contains instructions that only the prover sees and executes. From the point of view of the verifier these hints do not exist.

# Program input
Adding program input to a Cairo program is easy – you create a json file with your program input, and pass it to cairo-run using the --program_input flag. Then you can use hints to access the content of this file using the variable program_input (recall that hints are only visible to the prover).
see prog_input_output.cairo as example.

# Taking advantage of nondeterminism
Say that you have a list of N pairs (key, value) and you want a function get_value_by_key that returns the value that’s associated with a certain key. You may assume that the keys are distinct. Take a moment to think how to write such a function.

The naive solution takes O(N) Cairo instructions. It turns out that using nondeterminism it can be done with a constant number of instructions! All we have to do is find the right index using a hint. Then, we check that we got the correct key, and that the index is in range

see key_value_constant_time.cairo as an example.
