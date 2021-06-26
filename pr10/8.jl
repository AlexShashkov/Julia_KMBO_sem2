n=length(colors) 
#$z^n=1$ 
root = [exp(im*2π*i/n) for i in 0:n-1]

function newton(z::Complex, root::Vector{Compex}, ε::AbstractFloat, niter::Integer) 
    n=length(root)
    for i in 1:niter  
        z -= (z - 1/z^(n-1))/n 
        # z = z - (z^n - 1)/(n*z^(n-1))
        result = findfirst(r->abs(r-z) <= ε, root) 
        if !isnothing(result)
            return result
        end
    end
    return nothing
end
z = complex((rand(2) .- 0.5) .* squaresize)      
function visualisation(D, colors; markersize, backend::Function)
    backend("pyplot") 
    p=plot()
    for i in 1:length(colors)
        plot!(p, real(D[i]), imag(D[i]),
            seriestype = :scatter,
            markersize = markersize,
            markercolor = colors[i])
    end
    plot!(p; ratio = :equal, legend = false)
    # ratio = :equal - определяет, что масштабы по осям координат будут одинаковые
    # legend = false - определяет, что на графике не будет выводится панель с подписями графиков
end
real.(D[i]), imag.(D[i])