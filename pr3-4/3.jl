function bubblesortEnhanced!(a::AbstractArray)
    n=length(a)
    count = 1
    for _ in count:n-1
        for i in count + 1:n
            if a[i-1]>a[i]
                a[i-1],a[i]=a[i],a[i-1]
            end
        end
        count += 1
    end
    return a
end