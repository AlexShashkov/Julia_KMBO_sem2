include("345.jl")

function evaldiffpoly(x, polynomᵪ) 
    Q′=0
    Q=0
    for a in polynomᵪ
        Q′=Q′x+Q
        Q=Q*x+a
    end
    return Q, Q′
end