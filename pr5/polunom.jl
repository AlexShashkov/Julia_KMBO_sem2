struct Polynom{T} 
    coeff::Vector{T} 
end


module Polynoms
    import Base: +, * # переопределим базовые операции

    struct Polynom{T}
        coeff::Vector{T}
    end

    function +(p_poly::Polynom, q_poly::Polynom)
        np,nq = length(p_poly.coeff), length(q_poly.coeff)
        r=Vector{promote_type(eltype(p_poly),eltype(q_poly))}(undef,max(np,nq))
        if np >= nq
            for i in length(p_poly.coeff)-nq+1:length(p_poly.coeff)
                r[i] = p_poly.coeff[i] + q_poly.coeff[i-length(p_poly.coeff)+nq]
            end
        else
            for i in length(q_poly.coeff)-np+1:length(q_poly.coeff)
                r[i] = q_poly.coeff[i] + r.coeff[i-length(q_poly.coeff)+np]
            end
        end
        return Polynom(r)
    end

#= 
Здесь использована встроенная функция promote_type, которая получает на вход список типов и возвращает тот тип из этого списка,
к которому автоматически будут приведиться все остальные при выполнении встроенных операций, если аргументы этих операций будут иметь разные типы.
Например, при сложении значений типов Float64 и Int64, второе значение автоматически будет приведено к типу Float64. 
=#

    function +(p_poly::Polynom, c::Number) # многочлен с числом
        coeff=p_poly.coeff
        coeff[end]+=c
        return Polynom(coeff)
    end

    function +(c::Number, p_poly::Polynom) # число с многочленом
        coeff=p_poly.coeff
        coeff[end]+=c
        return Polynom(coeff)
    end

    function +(p_poly::Polynom, q_poly::Polynom) # многочлен с многочленом
        np,nq = length(p_poly.coeff), length(q_poly.coeff)
        coeff=zeros(promote_type(eltype(p_poly),eltype(q_poly)), np+nq-1)
        for i in eachindex(p_poly.coeff), j in eachindex(q_poly)
            coeff[i] += p_poly.coeff[i]+q_poly.coeff[j]
        end
        return Polynom(coeff)
    end

    +(c::Number, p_poly::Polynom)=p_poly+c

    function *(p_poly::Polynom, q_poly::Polynom) # многочлен на многочлен
        np,nq = length(p_poly.coeff), length(q_poly.coeff)
        coeff=zeros(promote_type(eltype(p_poly),eltype(q_poly)), np+nq-1)
        for i in eachindex(p_poly.coeff), j in eachindex(q_poly)
            coeff[i+j-1] += p_poly.coeff[i]*q_poly.coeff[j]
        end
        return Polynom(coeff)
    end

    function *(p_poly::Polynom, c::Number) # многочлен на число
        np,nq = length(p_poly.coeff), length(q_poly.coeff)
        coeff=zeros(promote_type(eltype(p_poly),typeof(c)), length(p_poly))
        for i in eachindex(p_poly.coeff)
            coeff[i] += coeff[i]*c
        end
        return Polynom(coeff)
    end
    function *(c::Number, p_poly::Polynom) # число на многочлен
        np, nq = length(p_poly.coeff), length(q_poly.coeff)
        coeff=zeros(promote_type(eltype(p_poly),typeof(c)), length(p_poly))
        for i in eachindex(p_poly.coeff)
            coeff[i] += coeff[i]*c
        end
        return Polynom(coeff)
    end
    
    *(c::Number, p_poly::Polynom) = p_poly*c
end
#=
p_poly=Plynom([1,2,3,4])
q_poly=Plynom([1,2,1])
eval_poly(q_poly,p_poly) # - новый многочлен, представляющий собой композицию двух данных многочленов=#