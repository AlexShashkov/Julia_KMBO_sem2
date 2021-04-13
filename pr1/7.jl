
"""
СОРТИРОВКА ВСТАВКАМИ
"""

function insertsort!(array, sized)
    for i ∈ 2:sized
        x = array[i]
        j = i
        while (j > 1 && array[j-1] > x)
            swap!(array, j, j-1)
            j -= 1
        end
    end
    return array
end

function insertsort(array, sized)
    return insertsort!(copy(array), sized)
end