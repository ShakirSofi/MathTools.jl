using Test
using MathTools.DirectMethods

@testset "LU Factorization" begin
    A = [1  1  2
         1  2  2
         2  2  2]

    L = [1.0  0.0  0.0
           1.0  1.0  0.0
           2.0  0.0  1.0]
    U = [1.0  1.0   2.0
           0.0  1.0   0.0
           0.0  0.0  -2.0]
    f = lu_factorization(A)
    @test f.U ≈ U
    @test f.L ≈ L
end
