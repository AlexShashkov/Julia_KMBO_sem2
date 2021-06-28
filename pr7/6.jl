function gcd_2(num1::Integer, num2::Integer)
    if num1 == 0
        return (num2, 0, 1)
    else
        div, x, y = gcd_2(num2 % num1, num1)
    end
    return (div, y - (num2 // num1) * x, x)
end

function invar(num1::Integer, num2::Integer)
    _, ret, __ = gcd_ext(num1,num2)
    if ret<0
        ret += num2
    end
    if num1*ret%num2 == 1
        return ret
    else
        return nothing
    end
end

function factor(α) 
    α_ = α
    result = []
    
    for i in 2:α
        if α_ % i == 0
            push!(result, i)
            α_ = α_ // i
        end
    end
    return result
end

function factor2(α)
    α_ = α
    result = []
    krat = []
    i = 2
    cnt = 0

    while i <= α
        if α_ % i == 0
            if cnt == 0
                push!(result, i)
            end
            α_ = α_ // i
            cnt += 1
        else
            if cnt != 0
                push!(krat, cnt)
            end
            cnt = 0
            i += 1
        end
    end
    return (result, krat)
end