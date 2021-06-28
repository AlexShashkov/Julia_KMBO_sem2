function quicksortUser1!(a)
    if isempty(a)
        return a
    end
    a, i, j = partsort!(a,a[begin]) 
    quicksortUser1!(@view a[begin:i])
    quicksortUser1!(@view a[j+1:end])
    return a
end