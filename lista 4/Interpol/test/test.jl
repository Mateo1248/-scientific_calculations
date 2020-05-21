# Mateusz Kościelniak
# indeks: 244973

include("../src/Interpol.jl")
using .Interpol, Test 

@testset "naturalna" begin
    @test naturalna([1.0, -2.0, 5.0], [1.0, 2.0, 4.0]) ≈ [-9, 6, 4] atol=eps(Float64)
end