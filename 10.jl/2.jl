include("1.jl")
newton(x->(x-cos(x))/sin(x), 0.5)