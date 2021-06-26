function bubblesortEnchanched!(a)
    n=length(a)
    for _ in 1:n-1
        for i in 2:n    
            if a[i-1]>a[i]
                a[i-1],a[i]=a[i],a[i-1]
            end
        end
    end
    return a
end