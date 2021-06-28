function newtonFunction(function::Function, a; εₓ=1e-8, εᵩ=1e-8, finaliteration=20)    
    iter = 0
    aᵪ = a 
    value = function(aᵪ)
    valueₙ = value - function(value)

    while abs(valueₙ - value) > εₓ && abs(function(valueₙ)-function(value)) > εᵩ  
        value = valueₙ 
        valueₙ = value - function(value)
        iter+=1
        if(iter > finaliteration)
            return nothing
        end
    end
    return valueₙ
end