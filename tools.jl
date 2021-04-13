module Tools
    function swap(array, x, y)
        array[x], array[y] = array[y], array[x]
        return array
    end
end