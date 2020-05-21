# Mateusz Kościelniak
# indeks: 244973

include("../FindRoots/src/FindRoots.jl")
using .FindRoots

f(x) = sin(x) - (x/2) ^ 2
pf(x) = cos(x) - (1/2)*x
delta = 0.5 * 10^(-5)
epsilon = 0.5 * 10^(-5)

println("metoda bisekcji:")
println(mbisekcji(f, 1.5, 2.0, delta, epsilon))

println("metoda stycznych:")
println(mstycznych(f, pf, 1.5, delta, epsilon,100))

println("metoda siecznych:")
println(msiecznych(f, 1.0, 2.0, delta, epsilon,100))