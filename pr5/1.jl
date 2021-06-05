function eval_poly(x,A)
    Q = first(A) # - $a_0$
    for a in @view A[2:end]
        Q=Q*x+a
    end
    return Q
end