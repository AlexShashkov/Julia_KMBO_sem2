"""
СОРТИРОВКА СТОЛБЦОВ МАТРИЦЫ
"""

include("3.jl")

function bubble!(array::Matrix)
    sized = size(array)
    for i ∈ 1:sized[2]
        arr = array[:, i]
        bubble!(arr)
        for j ∈ 1:sized[1]
            array[j, i] = arr[j]
        end
    end

    return array
end

function bubblem(array::Matrix)
    return bubblem!(copy(array))
end

function summ!(array::Matrix)
    sized = size(array)

    sums = []
    newarr = []
    for i ∈ 1:sized[2]
        arr = array[:, i]
        append!(sums, sum(arr))
    end

    sums = convert(Array{Int64, 1}, sums)
    #print(sums)
    indexes = bubbleperm(sums)

    for i ∈ indexes
        #print(array[:, i], "\n")
        append!(newarr, array[:, i])
    end
    newarr = reshape(newarr, sized[1], sized[2])
    newarr = convert(Array{Int64, 2}, newarr)

    return newarr
end

function summ(array::Matrix)
    return summ!(copy(array))
end