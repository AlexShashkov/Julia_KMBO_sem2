function insertsort!(a)
    for i in 2:length(a)
        x = a[i]
        j = i
        while ((j > 1) && (a[j-1] > x))
            a[j] = a[j-1]
            j -= 1
        end
        a[j] = x
     end
     return a
end

function insertsort(a)
    b = copy(a)
    for i in 2:length(b)
        x = b[i]
        j = i
        while ((j > 1) && (b[j-1] > x))
            b[j] = b[j-1]
            j -= 1
        end
        b[j] = x
     end
     return b
end