include("./Interpol/src/Interpol.jl")
using .Interpol

println(naturalna(Float64[-1, 0, 1, 2], ilorazyRoznicowe(Float64[-1, 0, 1, 2], Float64[-1, 0, -1, 2])))