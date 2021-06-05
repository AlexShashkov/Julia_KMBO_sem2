function grahamscan(A)
    points = length(A) 
    listofpoints = collect(points) 
    for i in 2:points # первый шаг алгоритма заключается в том, чтобы первой точкой в listofpoints оказалась точка с наименьшей x-координатой
        if A[listofpoints[i]][1] < A[listofpoints[1]][1] # если listofpoints[i]-ая точка лежит левее listofpoints[0]-ой точки
        listofpoints[i], listofpoints[1] = listofpoints[1], listofpoints[i] # меняем местами номера этих точек 
    for i in 3:points # сортировка вставкой
        j = i
        while ((j>1) && (rotate(A[listofpoints[0]],A[listofpoints[j-1]],A[listofpoints[j]])<0))
            listofpoints[j], listofpoints[j-1] = listofpoints[j-1], listofpoints[j]
            j -= 1
        end
    end
    S = collect(2)
    S[1] = listofpoints[1]
    S[2] = listofpoints[2]    
    for i in 3:points
        while (rotate(A[S[-2]],A[S[-1]],A[listofpoints[i]])<0)
            delete!(S,S[-1]) 
        end
        S.insert!(listofpoints[i]) 
    end
    return S
end