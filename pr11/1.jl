using Plots
using LinearAlgebra

module VectorsSpace
    export Vector2D, xdot, sin, cos
    Vector2D{T<:Real} = Tuple{T,T}

    Base. cos(a::Vector2D, b::Vector2D) = dot(a,b)/norm(a)/norm(b)
    xdot(a::Vector2D, b::Vector2D) = a[1]*b[2]-a[2]*b[1]  
    Base. sin(a::Vector2D, b::Vector2D) = xdot(a,b)/norm(a)/norm(b)

    VectorXY{T<:Real}=NamedTuple{(:x, :y), Tuple{T,T}}

    # переобозначение операций для VectorXY
    Base. +(a::VectorXY{T},b::VectorXY{T}) where T = VectorXY{T}(Tuple(a).+Tuple(b))
    # +
    Base. -(a::VectorXY{T},b::VectorXY{T}) where T = VectorXY{T}(Tuple(a).-Tuple(b))
    # -
    Base. *(coeff, a::VectorXY{T}) where T = VectorXY{T}(coeff.*Tuple(a))
    # times
    # lenght
    LinearAlgebra.norm(a::VectorXY) = norm(Tuple(a))

    LinearAlgebra.dot(a::VectorXY{T},b::VectorXY{T}) where T = dot(Tuple(a),Tuple(b))
    Base. cos(a::VectorXY{T},b::VectorXY{T}) where T = dot(a,b)/norm(a)/norm(b) # cos
    xdot(a::VectorXY{T},b::VectorXY{T}) where T = a.x*b.y-a.y*b.x               # dot
    Base. sin(a::VectorXY{T},b::VectorXY{T}) where T = xdot(a,b)/norm(a)/norm(b)# sin
end

randpoints(random::Function, num::Integer) = [(random(),random()) for σ in 1:num]