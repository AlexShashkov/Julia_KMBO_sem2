function bfs(start::T, graph::ConnectList{T}) where T
    marked = zeros(Bool, length(graph))
    queue  = [start] 
    marked[start] = 1 
    while !isempty(queue)
        v = popfirst!(queue)
        for μ in graph[v] 
            if marked[μ] == 0
                push!(queue, μ) 
                marked[μ] = 1
            end
        end
    end

    return marked
end