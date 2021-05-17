function permuteUser!(A, perm)
    for i in perm
        if perm[i] != i
            A[perm[i]] = A[i]
        end
    end
    return A
end