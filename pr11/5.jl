ENV["MPLBACKEND"]="tkagg" # graphics lib
include("1.jl")

# Ω - точки на плоскости
# Γ - прямой
function plotCreator(Ω, Γ) 
    upₓ = []
    upⱼ = [] 
    downₓ = [] 
    downⱼ = []

    k = (Γ[2][1] - Γ[1][1])/(Γ[2][2]-Γ[1][2])
    b = Γ[1][2] - k*Γ[1][1]

    for i in Ω
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
                (Γ[1][1], Γ[1][2]),
                (Γ[2][1], Γ[2][2])
            ]
        )
    )

    result = scatter!(upₓ, upⱼ, color="cyan")
    result = scatter!( downₓ, downⱼ, color="red")
    return result
end