function swap!(array, x, y)
    return swap(array, x, y)
end

"""
CОРТИРОВКА ПУЗЫРЬКОМ
"""

function bubble!(array::Vector, needindexes=false)
    sized = length(array)
    indexes = collect(1:sized)
    while true
        sorted = true
        for i ∈ 1:sized-1
            if array[i] > array[i+1]
                sorted = false
                array = swap(array, i, i+1)
                swap!(indexes, i, i+1)
            end
        end
        if sorted break end
    end
    if needindexes
        return (array, indexes)
    else
        return array
    end
end

function bubble(array::Vector, needindexes=false)
    return bubble!(copy(array), needindexes)
end

function bubbleperm!(a::Vector)
    sized = length(a)
    indexes = collect(1:sized)
    for k ∈ 1:sized-1
        istranspose = false
        for i ∈ 1:sized-k
            if a[i]>a[i+1]
                a[i],a[i+1]=a[i+1],a[i]
                indexes[i],indexes[i+1]=indexes[i+1],indexes[i]
                istranspose = true
            end
        end
        if istranspose == false
            break
        end
    end
    return indexes
end

function bubbleperm(array::Vector)
    return bubbleperm!(copy(array))
end