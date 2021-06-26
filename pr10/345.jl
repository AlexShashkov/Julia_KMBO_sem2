include("1.jl")
newton(ff::Tuple{Function,Function}, x; ε_x=1e-8, ε_y=1e-8, nmaxiter=20)=
    newton(x->ff[1](x)/ff[2](x), x; ε_x, ε_y, nmaxiter)

#newton((x->x-cos(x), x->sin(x)), 0.5) 
#newton((x->x-cos(x), sin), 0.5) 
#newton(x->(x-cos(x),sin(x)), 0.5) 