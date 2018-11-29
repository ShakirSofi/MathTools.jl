using Test
using MathTools.BackSubstitution

@testset "back substitution" begin
    A = [1  0    0
         0  1/2  0
         0  0    1/3]

    b = [1, 1, 1]
    @test back_substitution(A, b) ≈ [1., 2., 3.]

    A = [1 2 3
         0 1 2
         0 0 3]

    b = [1, 2, 3]
    @test back_substitution(A, b) ≈ [-2., 0., 1.]

    @test_throws DimensionMismatch back_substitution(A, [1, 2])

    @testset "non tri matrix" begin
        A = [1 2 3
             0 1 2
             1 0 3]
        @test_throws DimensionMismatch back_substitution(A, [1, 2, 2])
    end

end
