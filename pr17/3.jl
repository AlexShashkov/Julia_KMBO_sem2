function valentnost(graph)
    val = []
    for i in graph
        push!(val, length(i))
    end
    return val
end