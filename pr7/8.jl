function eratosphen(number::Integer)
    res=fill(true,number)
    res[1]=false
    i=2
    #- число i - простое
    while i<number || ! (i === nothing)
        res[2i:i:end] .= false
        i=findnext(res, i+1)
    end
    return findall(res)
end