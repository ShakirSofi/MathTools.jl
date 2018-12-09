struct NotSpdMatrix <: Exception
    msg::String
end

function cholesky(M::AbstractMatrix)
    A::Matrix{Float64} = copy(M)
    n, m = size(A)
    @assert m == n
    R = zeros(n, m)
    try
        for k = 1:n
            for j = k+1:n
                A[j,j:end] = A[j,j:end] - A[k,j] / A[k,k] * A[k,j:end]
            end
            R[k,k:end] = A[k,k:end] / sqrt(A[k,k])
        end
    catch error
        if typeof(error) in [DomainError DivideError]
            throw(NotSpdMatrix("Argument must be SPD matrix"))
        else
            throw(error)
        end
    end
    return R
end
