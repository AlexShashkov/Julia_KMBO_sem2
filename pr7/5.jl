function eratosphen(number::Int)
    placer = zeros(Int, number)
    for i in (1:number)
        placer[i] = i
    end
    for i in 2:number
        j = 2*i
        if isPrime(i)
            while j <= number
                placer[j] = 0
                j += i
            end
        end
    end
    resheto = []
    for i in 1:number
        if placer[i] != 0
            resheto = vcat(resheto, placer[i])
        end
    end
    return resheto
end