function is_achievable_ok(start::Integer, graph::ConnectList)
    mk = zeros(Bool, length(graph))
    attempt_achievable!(start, graph, mk)
    return count(i->i==0, mk) == 0 
end

function is_strong(graph::ConnectList)
    for i in 1:length(graph)
        if is_achievable_ok(i, graph) == false
            return false
        end
    end
    return true
end