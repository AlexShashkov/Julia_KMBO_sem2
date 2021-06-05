function jarvismarch_usr(A) 
    len = length(A)
    collcetion = collect(len) 

    for i in 2:len # берем самую левую точку из A
        if A[collcetion[i]][1]<A[collcetion[1]][1] 
            collcetion[i], collcetion[1] = collcetion[1], collcetion[i]  
    end

    wershina = [collcetion[1]] # делаем стартовую вершину текущей, ищем самую правую точку в A относительно текущей вершины, делаем ее текущей и т.д.
    delete!(collcetion,collcetion[1])
    collcetion.insert!(wershina[1])
    while True # Теперь организуем бесконечный цикл, на каждой итерации которого ищем самую левую точку из collcetion относительно последней вершины в wershina
        right = 0
        for i in 2:len(collcetion)
          if rotate(A[wershina[-1]],A[collcetion[right]],A[collcetion[i]])<0
            right = i
            
          end
        end
        if collcetion[right]==wershina[1]
          break
        else
          wershina.insert!(collcetion[right])
          delete!(collcetion,collcetion[right])
        end
      return wershina
    end
end