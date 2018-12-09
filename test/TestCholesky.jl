using Test
using MathTools.DirectMethods


@testset "Cholesky factorization" begin
    A = [2 1 0 0
         1 2 1 0
         0 1 2 1
         0 0 1 2]

    R = cholesky(A)
    display(R)
    @test R ≈ [sqrt(2) sqrt(1/2) 0 0
               0 sqrt(3/2) sqrt(2/3) 0
               0 0 sqrt(4/3) sqrt(3/4)
               0 0 0 sqrt(5/4)]
end

@testset "Zero on diagonal" begin
    A = [2 1 0 0
         1 2 1 0
         0 1 0 1
         0 0 1 2]

    @test_throws DirectMethods.NotSpdMatrix cholesky(A)
end

@testset "Not SPD" begin
    A = [2 1 0 0
         1 2 3 0
         0 1 2 1
         0 0 1 2]

    @test_throws DirectMethods.NotSpdMatrix cholesky(A)
end
