
using LinearAlgebra

struct Factorization
    L::Matrix{Float64}
    U::Matrix{Float64}
end


function lu_factorization(A::AbstractMatrix)::Factorization
    n, m = size(A)
    @assert n == m
    L = Matrix{Float64}(I, n, n)
    U = copy(A)
    U = convert(Matrix{Float64}, U)

    for k = 1:n-1
        for j = k+1:n
            L[j,k] = U[j,k]/U[k,k]
            for l = k:n
                U[j,l] = U[j,l] - L[j,k] * U[k,l]
            end
        end
    end

    Factorization(L, U)
end
