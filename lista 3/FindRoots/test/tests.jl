# Mateusz Kościelniak
# indeks: 244973

include("../src/FindRoots.jl")
using .FindRoots, Test 

f(x) = x^2 - 4
pf(x) = 2*x

delta = 10^(-6)
epsilon = 10^(-6)

@testset "Metoda bisekcji" begin
    @test mbisekcji(f, 4.0, 5.0, delta, epsilon)[4] == 1
    @test mbisekcji(f, 1.0, 3.0, delta, epsilon)[1] ≈ 2.0 atol=epsilon
end

@testset "Metoda stycznych" begin
    @test mstycznych(f, pf, 5.0, delta, epsilon, 1)[4] == 1
    @test mstycznych(f, pf, 0.0, delta, epsilon, 100)[4] == 2
    @test mstycznych(f, pf, 2.5, delta, epsilon, 100)[1] ≈ 2.0 atol=epsilon
end

@testset "Metoda siecznych" begin
    @test msiecznych(f, 4.0, 5.0, delta, epsilon, 1)[4] == 1
    @test msiecznych(f, 1.0, 3.0, delta, epsilon, 100)[1] ≈ 2.0 atol=epsilon
end
