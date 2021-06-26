using Plots
include("1.jl")

function plot_segments(σ::Vector{Tuple{Point2D,Point2D}}; kwargs...)
    retplot = plot(;kwargs...)
    for s in σ
        plot!(collect(s); kwargs...)
    end
    return retplot
end