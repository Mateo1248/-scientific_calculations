# Mateusz Kościelniak
# indeks: 244973

include("./Interpol/src/Interpol.jl")
using .Interpol

f(x) = exp(x)
a = Float64(0.0)
b = Float64(1.0)

for n in 5:5:15
    rysujNnfx(f, a, b, n)
end

f(x) = (x^2) * sin(x)
a = Float64(-1.0)
b = Float64(1.0)

for n in 5:5:15
    rysujNnfx(f, a, b, n)
end