ConnectList{T}=Vector{Vector{T}}
NestedVectors = Vector

mutable struct Tree{T}
    index::T
    sub::Vector{Tree{T}}
    Tree{T}(index) where T = new(index, Tree{T}[])
end