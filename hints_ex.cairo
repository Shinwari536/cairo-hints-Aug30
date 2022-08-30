func foo() -> (res : felt):
    alloc_locals
    local x = 5  # Note this line.
    assert x * x = 25
    return (res=x)
end
# From the point of view of the prover, both functions return 5.
#**************************************
# From the point of view of the verifier, foo returns 5 as well

func bar() -> (res : felt):
    alloc_locals
    local x
    %{ ids.x = 5 %}  # Note this line.
    assert x * x = 25
    return (res=x)
end
# but the hint in bar is ignored and thus bar looks to the verifier as follows:

# func bar() -> (res):
#     alloc_locals
#     local x
#     assert x * x = 25
#     return (res=x)
# end

# where there is no hint, so the value of x is hidden from Varifier.