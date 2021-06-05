function log_u(a::Real, x::Real) 
    @assert a>1
    @assert x>0
    z, t, y = x, 1, 0
    # a^y * z^t == x (=const)
    while z > a || z < 1/a || t > ε   
        if z > a
            z /= a
            y += t 
            # z^t = (z/a)^t * a^t
        elseif z < 1/a
            z *= a
            y -= t 
            # z^t = (z*a)^t * a^-t
        else
            t /= 2
            z *= z
             # z^t = (z*z)^(t/2)
        end
    end
end