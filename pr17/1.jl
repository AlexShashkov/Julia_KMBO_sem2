function dfs(start::T, graph::ConnectList{T}) where T
    marked = zeros(Bool, length(graph)) 
    stack  = [start] 
    marked[start] = 1 
    while !isempty(stack)
        v = pop!(stack) 
        for μ in graph[v] 
            if marked[μ] == 0
                push!(stack,μ)
                marked[μ] = 1 
            end
        end
    end
    return marked
end