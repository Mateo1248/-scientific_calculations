# Mateusz Kościelniak
# indeks: 244973

include("../FindRoots/src/FindRoots.jl")
using .FindRoots

f1(x) = exp(1 - x) - 1
pf1(x) = - exp(1 - x)
f2(x) = x * exp(-x)
pf2(x) = exp(-x) - x*(exp(-x))

delta = 10^(-5)
epsilon = 10^(-5)

println("Pierwsza część zadania.")
println("metoda bisekcji:")
println("f1: ", mbisekcji(f1, 0.0, 1.5, delta, epsilon))
println("f2: ", mbisekcji(f2, -0.5, 1.0, delta, epsilon))
println("f2: ", mbisekcji(f2, -0.5, 1000.0, delta, epsilon))
println("metoda stycznych:")
println("f1: ", mstycznych(f1, pf1, 0.5, delta, epsilon,100))
println("f2: ", mstycznych(f2, pf2, -0.5, delta, epsilon,100))
println("metoda siecznych:")
println("f1: ", msiecznych(f1, -1.0, 1.5, delta, epsilon,100))
println("f2: ", msiecznych(f2, -1.0, 0.5, delta, epsilon,100))

println("\nDruga część zadania.")
println("f1: ", mstycznych(f1, pf1, 2.0, delta, epsilon,100))
println("f1: ", mstycznych(f1, pf1, 5.0, delta, epsilon,100))
println("f1: ", mstycznych(f1, pf1, 6.0, delta, epsilon, 200))
println("f1: ", mstycznych(f1, pf1, 7.0, delta, epsilon,1000))

println("f2: ", mstycznych(f2, pf2, 1.0, delta, epsilon,100))
println("f2: ", mstycznych(f2, pf2, 2.0, delta, epsilon,100))
println("f2: ", mstycznych(f2, pf2, 5.0, delta, epsilon,100))
println("f2: ", mstycznych(f2, pf2, 6.0, delta, epsilon,100))
println("f2: ", mstycznych(f2, pf2, 7.0, delta, epsilon,100))
#=
function findSection(f)
    it = -100
    section = 2

    while it < 100
        if sign(f(it-section))*sign(f(it)) < 0
            println(it-section, " ", it)
        end
        it += 0.25
    end
end

println("funkcja pierwsza:")
findSection(f1)
println("funkcja druga:")
findSection(f2)

wyjście:
funkcja pierwsza:
-0.75 1.25
-0.5 1.5
-0.25 1.75
0.0 2.0
0.25 2.25
0.5 2.5
0.75 2.75
funkcja druga:
-1.75 0.25
-1.5 0.5
-1.25 0.75
-1.0 1.0
-0.75 1.25
-0.5 1.5
-0.25 1.75
=#