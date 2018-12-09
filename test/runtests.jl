#=
runtests:
- Julia version: 1.0.1
- Author: sebastian
- Date: 2018-11-20
=#

using Base.Filesystem

current_dir = @__DIR__
ROOT = abspath(joinpath(current_dir, ".."))
SRC_DIR = joinpath(ROOT, "src")

push!(LOAD_PATH, SRC_DIR)

using Test
using MathTools


include("TestBackSubstitution.jl")
include("TestGaussianElimination.jl")
include("TestCholesky.jl")
