module DirectMethods

include("GaussianElimination.jl")
include("BackSubstitution.jl")
export back_substitution
export lu_factorization

end
