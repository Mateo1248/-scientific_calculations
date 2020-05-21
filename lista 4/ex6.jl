# Mateusz Kościelniak
# indeks: 244973

include("./Interpol/src/Interpol.jl")
using .Interpol

f(x) = abs(x)
a = Float64(-1.0)
b = Float64(1.0)

for n in 5:5:15
    rysujNnfx(f, a, b, n)
end

f(x) = 1/(1 + x^2)
a = Float64(-5.0)
b = Float64(5.0)

for n in 5:5:15
    rysujNnfx(f, a, b, n)
end