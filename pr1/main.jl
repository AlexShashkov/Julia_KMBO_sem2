ENV["MPLBACKEND"]="tkagg"

include("pr1/sortings.jl")

size_X = 1
array = rand(Int64, 100, size_X)
Sortings.bubble!(array)

array = rand(Int64100, size_X)
Sortings.bubble(array)
#array = sortperm(array, size_X)
#array = sortinsert(array, size_X)

size_x = 10
size_y = 10

matrix = rand(1:100, size_x, size_y)
Sortings.summ!(matrix)
Sortings.bubblem!(matrix)