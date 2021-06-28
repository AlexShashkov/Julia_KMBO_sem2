function mergeArrays(α::AbstractArray, β::AbstractArray)
    result = []
    alpha_iterator = 1
    beta_iterator = 1

    αₗ = length(α)  
    βₗ = length(β)

    while (alpha_iterator <= αₗ) && (beta_iterator <= βₗ)
        if alpha_iterator <= αₗ
            if α[alpha_iterator] < β[beta_iterator]
                push!(result, α[alpha_iterator])
                alpha_iterator += 1
            end
        end

        if beta_iterator <= βₗ
            if α[alpha_iterator] >= β[beta_iterator]
            push!(result, β[beta_iterator])
            beta_iterator += 1
            end
        end
    end

    if alpha_iterator < αₗ
        for i in (alpha_iterator+1):αₗ
            push!(result, α[i])
        end
    end

    if beta_iterator < βₗ
    for i in (beta_iterator+1):βₗ push!(result, β[i]) end
    end
    return result
end
