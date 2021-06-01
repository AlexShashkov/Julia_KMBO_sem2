function sort_key(a, key)
    ind = sort_perm!(key)
    return @view a[ind]
end

function sortkey!(key_values, a) # - не удачный вариант!
    indperm=sortperm!(key_values)
    return a[indperm]
end