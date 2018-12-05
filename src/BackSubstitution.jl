using LinearAlgebra

function back_substitution(A, b)
    a_nrow, a_ncol = size(A)
    b_ncol, = size(b)
    if a_nrow != a_ncol || b_ncol != a_ncol
        throw(DimensionMismatch("Dimensions of A and b must match. b needs to be a column array."))
    end

    if !istriu(A)
        throw(DimensionMismatch("Matrix A must be upper triangular!"))
    end

    n = a_nrow
    x = zeros(a_nrow)
    for j = n : -1: 1
        x[j] = (b[j] - A[j, j+1:end]' * x[j+1:end]) / A[j, j]
    end

    return x
end
