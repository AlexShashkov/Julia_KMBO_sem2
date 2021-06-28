function log_u(a::Real, x::Real) 
    @assert a>1
    @assert x>0
    z, t, y = x, 1, 0
    ε = 0.00001
    # aʸ ⋅ zᵗ == x 
    while z > a || z < 1/a || t > ε   
        if z > a
            z /= a
            y += t 
            # zᵗ = (z/a)^t ⋅ aᵗ
        elseif z < 1/a
            z *= a
            y -= t 
            # zᵗ = (z⋅a)ᵗ ⋅ a⁻ᵗ
        else
            t /= 2
            z *= z
             # zᵗ = (z⋅z)⁽ᵗ/²⁾
        end
    end
end