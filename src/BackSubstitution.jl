module BackSubstitution

function back_substitution(A, b)
    a_nrow, a_ncol = size(A)
    b_nrow, b_ncol = size(b)

    if (b_nrow != 1 && b_ncol != 1) || a_nrow != a_ncol || (a_ncol != b_ncol && a_ncol != b_nrow)
        error("Dimension mismatch")
    end

    n = a_nrow
    x = zeros((a_nrow,) )
    for j = n : -1: 1
        x[j] = (b[j] - A[j, j+1:end]' * x[j+1:end]) / A[j, j]
    end
    return x
end

end