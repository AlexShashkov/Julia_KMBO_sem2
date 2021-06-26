function jarvismarch_usr(α) 
    len = length(α)
    collcetion = collect(len) 

    for i in 2:len # берем самую левую точку из α
        if α[collcetion[i]][1]<α[collcetion[1]][1] 
            collcetion[i], collcetion[1] = collcetion[1], collcetion[i]  
    end

    wershina = [collcetion[1]] # делаем стартовую вершину текущей, ищем самую правую точку в α относительно текущей вершины, делаем ее текущей и т.д.
    delete!(collcetion,collcetion[1])
    collcetion.insert!(wershina[1])
    while True # Теперь организуем бесконечный цикл, на каждой итерации которого ищем самую левую точку из collcetion относительно последней вершины в wershina
        right = 0
        for i in 2:len(collcetion)
          if rotate(α[wershina[-1]],α[collcetion[right]],α[collcetion[i]])<0
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