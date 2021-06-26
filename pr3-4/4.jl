function shell!(a)
    n=length(a)
    generator=(n÷2^i for i in 1:Int(floor(log2(n)))) 
    for item in generator
        for i in firstindex(a):lastindex(a)-item
            j=i
            while j>=firstindex(a) && a[j]>a[j+item]
                a[j], a[j+item] = a[j+item], a[j]
                j -= item
            end
        end
    end
    return a
end