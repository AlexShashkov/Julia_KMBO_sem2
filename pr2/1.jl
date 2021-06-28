function sort_key(a, key)
    ind = sort_perm!(key)
    return @view a[ind]
end