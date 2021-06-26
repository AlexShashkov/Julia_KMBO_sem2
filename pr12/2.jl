function grahamscan(α)
    points = length(α) 
    listofpoints = collect(points) 
    for i in 2:points
        if α[listofpoints[i]][1] < α[listofpoints[1]][1] # если listofpoints[i]-ая точка лежит левее listofpoints[0]-ой точки
        listofpoints[i], listofpoints[1] = listofpoints[1], listofpoints[i] # меняем местами номера этих точек 
    for i in 3:points # вставка
        j = i
        while ((j>1) && (rotate(α[listofpoints[0]],α[listofpoints[j-1]],α[listofpoints[j]])<0))
            listofpoints[j], listofpoints[j-1] = listofpoints[j-1], listofpoints[j]
            j -= 1
        end 
    end
    S = collect(2)
    S[1] = listofpoints[1]
    S[2] = listofpoints[2]    
    for i in 3:points
        while (rotate(α[S[-2]],α[S[-1]],α[listofpoints[i]])<0)
            delete!(S,S[-1]) 
        end
        S.insert!(listofpoints[i]) 
    end
    return S
end