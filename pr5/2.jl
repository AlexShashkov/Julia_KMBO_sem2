module Polynoms
    import Base: +, *

    struct Polynom{T}
        coefficient::Vector{T}
    end

    function +(poly::Polynom, c::Number) # перегрузка многочлена с числом
        coefficient=poly.coefficient
        coefficient[end]+=c
        return Polynom(coefficient)
    end

    function +(c::Number, poly::Polynom) # перегрузка числа с многочленом
        coefficient=poly.coefficient
        coefficient[end]+=c
        return Polynom(coefficient)
    end

    function +(poly::Polynom, q::Polynom) # перегрузка многочлена с многочленом
        n,nq = length(poly.coefficient), length(q.coefficient)
        coefficient=zeros(promote_type(eltype(poly),eltype(q)), n+nq-1)
        for i in eachindex(poly.coefficient), j in eachindex(q)
            coefficient[i] += poly.coefficient[i]+q.coefficient[j]
        end
        return Polynom(coefficient)
    end

    +(c::Number, poly::Polynom) = poly+c

    function *(poly::Polynom, q::Polynom) # перегрузка многочлена на многочлен
        n,nq = length(poly.coefficient), length(q.coefficient)
        coefficient=zeros(promote_type(eltype(poly),eltype(q)), n+nq-1)
        for i in eachindex(poly.coefficient), j in eachindex(q)
            coefficient[i+j-1] += poly.coefficient[i]*q.coefficient[j]
        end
        return Polynom(coefficient)
    end

    function *(poly::Polynom, c::Number) # перегрузка многочлена на число
        coefficient=zeros(promote_type(eltype(poly),typeof(c)), length(poly))
        for i in eachindex(poly.coefficient)
            coefficient[i] += coefficient[i]*c
        end
        return Polynom(coefficient)
    end
    function *(c::Number, poly::Polynom) # перегрузка числа на многочлен
        coefficient=zeros(promote_type(eltype(poly),typeof(c)), length(poly))
        for i in eachindex(poly.coefficient)
            coefficient[i] += coefficient[i]*c
        end
        return Polynom(coefficient)
    end

    *(c::Number, poly::Polynom) = poly*c
end