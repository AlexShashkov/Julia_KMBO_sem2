function cyclshift(array::AbstrarrayctVector, smeshenie::Int) 
    reverse!(array)
    reverse!(@view array[begin:begin+smeshenie])
    reverse!(@view array[begin+smeshenie+1:end])
end