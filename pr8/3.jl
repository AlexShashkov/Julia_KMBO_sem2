function quicksortUser!(a)
    if isempty(a)
        return a
    end
    a, i, j = partsort!(a,a[begin]) 
    quicksortUser!(@view a[begin:i])
    quicksortUser!(@view a[j+1:end])
    return a
end