function u_copy!(_ret, array)
    a_size = size(array)
    empty!(_ret)
    if length(array) != a_size[1]
        reshape(_ret, a_size)
        for i ∈ a_size[1]
            for j ∈ a_size[2]
                _ret[i, j] = array[i, j]
            end
        end
        _ret = ret
    else
        reshape(_ret, a_size[1])
        for i ∈ a_size[1]
            _ret[i] = array[i]
        end
    end
end