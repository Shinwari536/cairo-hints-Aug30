%builtins output

from starkware.cairo.common.serialize import serialize_word

func main{output_ptr : felt*}():
    %{ memory[ap] = program_input['secret'] %}
    [ap] = [ap]; ap++
    serialize_word([ap - 1])
    return()
end
