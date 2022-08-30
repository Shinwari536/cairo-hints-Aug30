func foo() -> (res : felt):
    alloc_locals
    local x = 5  # Note this line.
    assert x * x = 25
    return (res=x)
end

func bar() -> (res : felt):
    alloc_locals
    local x
    %{ ids.x = 5 %}  # Note this line.
    assert x * x = 25
    return (res=x)
end
