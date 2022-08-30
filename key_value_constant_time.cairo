%builtins output range_check
from starkware.cairo.common.math import assert_nn_le
from starkware.cairo.common.alloc import alloc
from starkware.cairo.common.registers import get_fp_and_pc
from starkware.cairo.common.serialize import serialize_word




struct KeyValue:
    member key : felt
    member value : felt
end

# Returns the value associated with the given key.
func get_value_by_key{range_check_ptr}(list : KeyValue*, size, key) ->(value):
    alloc_locals
    local index

    # Hint
    %{
        ENTERY_SIZE = ids.KeyValue.SIZE
        KEY_OFFSET = ids.KeyValue.key
        VALUE_OFFSET = ids.KeyValue.value

        print(f'ids.list.address_ = {ids.list.address_}')
        print(f'ENTERY_SIZE = {ENTERY_SIZE}')
        print(f"KEY_OFFSET = {KEY_OFFSET}")
        print(f"VALUE_OFFSET = {VALUE_OFFSET}")
        print("*********************************************")

        for i in range(ids.size+1):
            addr = ids.list.address_ + ENTERY_SIZE * (i) # this will give us the address of the ** key ** of ith (at index i) object of KeyValue type from the list : KeyValue*
            print(f'{i}th object key address = {addr}\t{i}th object key = {memory[addr]}')
            if memory[addr] == ids.key:
                ids.index = i
                break
        else:
            raise Exception(
                f'Key {ids.key} was not found in the list.')

    %}

    # Verify that we have the correct key.
    let item : KeyValue = list[index]
    assert item.key = key
    # Verify that the index is in range (0 <= idx <= size - 1).
    assert_nn_le(a=index, b=size - 1)

    # Return the corresponding value.
    return (value=item.value)
end


func main{output_ptr : felt*, range_check_ptr}():
    alloc_locals
    local key_val_tuple : (
        KeyValue, KeyValue, KeyValue, KeyValue, KeyValue
    ) = (
        KeyValue(key=0, value=99),
        KeyValue(key=1, value=88),
        KeyValue(key=2, value=66),
        KeyValue(key=3, value=55),
        KeyValue(key=4, value=44)
        )
    # Get the value of the frame pointer register (fp) so that
    # we can use the address of loc0.
    let (__fp__, _) = get_fp_and_pc()

    let (value) = get_value_by_key(list=cast(&key_val_tuple, KeyValue*), size=5, key=3)
    %{
        print("*********************************************")
        print(f'value = {ids.value}')
    %}
    return()
end



