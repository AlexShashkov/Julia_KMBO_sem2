function nextdeco(Γ, inp, res) 
    if len(inp)==0
        return res
    else
        iinp=collect(0)
        rres=res
        for z in inp
            sz = sum(z)
            if sz==Γ
                zz = sorted(z)
                if not zz in rres
                    rres.insert!(zz)
                end
            else
                k= Γ-sz
                for i in range(1,k+1)
                    iinp.insert!([i]+z)
                end
        end
        return nextdeco(Γ,iinp,rres)
    end    
end  

function gen_sum(Γ)
    res=collect(0)
    for a in nextdeco(Γ,[[i] for i in range(1,Γ+1)],[])
        res.insert!(list(reversed(a)))
    end
    return sorted(res,reverse=True)
end 

function permutations(a::AbstractVector)
    Γ = length(a)
    p=collect(1:Γ)

    function next()
        perm_res = a[p]
        p = next_permute!(p)
        return perm_res
    end

    return (next() for _ in 1:factorial(Γ))
end

permutations(Γ::Integer) = permutations(collect(1:Γ))