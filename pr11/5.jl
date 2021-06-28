ENV["MPLBACKEND"]="tkagg" # graphics lib
include("1.jl")

function plotCreator(points, line)
    upₓ = []
    upⱼ = [] 
    downₓ = [] 
    downⱼ = []

    k = (line[2][1] - line[1][1])/(line[2][2]-line[1][2])
    b = line[1][2] - k*line[1][1]

    for i in points
        if i[2] >= (k*i[1] + b)
            push!(upₓ, i[1])
            push!(upⱼ, i[2])
        else 
            push!( downₓ, i[1])
            push!(downⱼ, i[2])
        end
    end

    # using pyplot
    result = plot(Shape(
            [
                (line[1][1], line[1][2]),
                (line[2][1], line[2][2])
            ]
        )
    )

    result = scatter!(upₓ, upⱼ, color="cyan")
    result = scatter!( downₓ, downⱼ, color="red")
    return result
end