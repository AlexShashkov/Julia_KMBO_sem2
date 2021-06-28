include("tools.jl")

function floyd(G::AbstractMatrix)
  Gₗ = size(G,1)
  result = Array{eltype(G),3}(undef,Gₗ,Gₗ,Gₗ)
  result[1,:,:] = G
  for k in 1:Gₗ, i in 1:Gₗ, j in 1:Gₗ
    result[k+1,i,j] = min(result[k,i,j], result[k,i,k]+result[k,k,j])
  end
  return result[end,:,:]
end

function floyd2(G::AbstractMatrix)
  Gₗ = size(G,1)
  result = Matrix{eltype(G)}(undef,Gₗ,Gₗ) 
  result = G
  for k in 1:Gₗ, i in 1:Gₗ, j in 1:Gₗ
    result[i,j] = min(result[i,j], result[i,k]+result[k,j])
  end
  return result
end

function floyd3(G::AbstractMatrix)
  Gₗ = size(G,1)
  result = Matrix{eltype(G)}(undef,Gₗ,Gₗ) 
  result = G
  for k in 1:Gₗ, i in 1:Gₗ, j in 1:Gₗ
    if result[i,j] > result[i,k]+result[k,k,j]
      result[i,j] = result[i,k]+result[k,j]
    end
  end
  return result
end