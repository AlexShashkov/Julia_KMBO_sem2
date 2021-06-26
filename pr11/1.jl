using Plots
module Vector2Ds

    export Vector2D, xdot, sin, cos
    using LinearAlgebra

    Vector2D{T<:Real} = Tuple{T,T}

    Base. cos(a::Vector2D, b::Vector2D) = dot(a,b)/norm(a)/norm(b)
    xdot(a::Vector2D, b::Vector2D) = a[1]*b[2]-a[2]*b[1]
    Base. sin(a::Vector2D, b::Vector2D) = xdot(a,b)/norm(a)/norm(b)
end

randpoints(random::Function, num::Integer) = [(random(),random()) for σ in 1:num]