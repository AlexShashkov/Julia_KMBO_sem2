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
        return "NONE"
    end
end