using Plots
include("1.jl")

points = randpoints(rand, 20)
scatter(points; legend = false)