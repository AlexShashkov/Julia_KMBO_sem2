function natural_1(num)
    result = collect(1:num)

    if num == 1
        result[1] = 1 
    else if num == 2
        result[1] = 1
        result[2] = 1
    else if num > 2
        result[1] = 1
        result[2] = 1
        count = 2
        while count != num
            A_copy = collect(1:num) 
            for i in 1:count
                if i == 1
                    A_copy[i] = result[i]
                else if i == count
                    A_copy[count] = result[count]
                else
                    A_copy[i] = result[i-1] + result[i]
                end 
            end
            result = A_copy
            count += 1
        end
    end

    return result
end

function natural_2(number)
    result = collect(1:number)

    for i in 1:number
        if i==1 || i==number
            result[1] = 1
        else
            result[number] = result[i-1] + result[i]
        end
    end

    return result
end

function natural_3(number)
    result = collect(1:number)

    if count % 2 == 0
        for i in 1:number/2
            if i==1 || i==number
                result[1] = 1
            else
                result[number] = result[i-1] + result[i]
            end
        end

        k = 1

        for j in number/2+1:number
            result[j] = result[j-k]
            k += 2
        end
    else
        
    for i in 1:number/2+1
        if i==1 || i==number
            result[1] = 1
        else
            c = natural_b(number)
            result[number] = result[i-1] + result[i]
        end
    end

        k = 2
        for j in number/2+2:number
            result[j] = result[j-k]
            k += 2
        end
    end

    return result
end