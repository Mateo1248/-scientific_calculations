# Mateusz Kościelniak
# indeks: 244973

include("../FindRoots/src/FindRoots.jl")
using .FindRoots, Plots
#plotly()

delta = 10^(-4)
epsilon = 10^(-4)

f(x) = exp(x) - 3 * x

#display(plot(f, -2, 3, legend=false))

println("(0.0, 1.0) ", mbisekcji(f, 0.0, 1.0, delta, epsilon))
println("(1.0, 2.0) ", mbisekcji(f, 1.0, 2.0, delta, epsilon))
