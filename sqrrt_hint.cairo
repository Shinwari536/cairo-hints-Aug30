
func main():
    [ap] = 25; ap++
    %{
        import math
        memory[ap] = int(math.sqrt(memory[ap - 1])) # + 1  --> this will add 1 to the sqrt (which will be 5 in our case) and it will become 6 
    %}

    [ap - 1] = [ap] * [ap]; ap++ # the above + 1 --> will give us following error

    # An ASSERT_EQ instruction failed: 25 != 36.
    #       6 * 6 *** but *** [ap - 1] = 25

    # python funtion print() inside hints.
    %{print("hello world")%}

    return ()
end