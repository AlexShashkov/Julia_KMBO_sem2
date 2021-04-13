include("7.jl")

insertsort!(array)=reduce(1:length(array))do _, i 
    while i>1 && array[i-1] > array[i]
        array[i-1], array[i] = array[i], array[i-1]
        i-=1
    end
    return array
end