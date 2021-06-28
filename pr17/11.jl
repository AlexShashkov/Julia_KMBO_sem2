function topologicalSorting(graph)

    function dfs!(v, series)
        mark[v]=1
        for μ in graph[v] 
            if mark[μ] == 0
                dfs!(μ, series)
            elseif mark[μ]==1
                return nothing
            end
        end
        mark[v]=2
        push!(series, v)
    end


    n = length(graph)
    mark = zeros(Int,n)
    series = []
    
    for s in 1:n
        if mark[s]==0
            dfs!(s, series)
        end
    end

    return reverse(series)
end