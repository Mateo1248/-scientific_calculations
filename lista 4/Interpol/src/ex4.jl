# Mateusz Kościelniak
# indeks: 244973

include("./ex1.jl")
include("./ex2.jl")
using Plots

#=
#  funkcja interpoluje funkcje f(x) na przedziale [a,b] za pomocą wielomianu
# interpolacyjnego stopnia n w postaci Newtona, nastepnie rysuje wileomian 
# interpolacyjny oraz interpolowaną funkcje
#
# f – funkcja f(x) zadana jako anonimowa funkcja
# a,b – przedział interpolacji
# n – stopień wielomianu interpolacyjnego
=#

function rysujNnfx(f, a::Float64, b::Float64, n::Int)

    if !(a > b)

        # wektor węzłów
        x = Vector{Float64}(undef, n+1)        

        # wektor wartości funkcji w kolejnych węzłach
        y = Vector{Float64}(undef, n+1)        

        # wektor ilorazów różnicowych dla kolejnych węzłów
        fx = Vector{Float64}(undef, n+1)                                      

        # maksymalna ilość węzłów
        max_k = n + 1                               

        # krok
        h = (b-a)/n                                 

        for i = 1: max_k
            x[i] = a + h*(i-1)
            y[i] = f(x[i])
        end

        fx = ilorazyRoznicowe(x, y);

        # mnożnik dla dokładiejszego rysowania wykresów
        density = 40                       

        interpol_y = Vector{Float64}(undef, density*(n + 1))
        interpol_x = Vector{Float64}(undef, density*(n + 1))      
        interpol_new = Vector{Float64}(undef, density*(n + 1))   

        max_k *= density
        h = (b - a)/(max_k-1)

        for i = 1: max_k
            interpol_x[i] = a + h*(i-1)
            interpol_new[i] = warNewton(x, fx, interpol_x[i])
            interpol_y[i] = f(interpol_x[i])
        end

        plotly()
        t = string("n= $n")
        plt = plot(interpol_x, [interpol_y, interpol_new], title=t, label=["f(x)" "interpolated f(x)"], linewidth=2.0)
        display(plt)

    else
        println("Zły przedział")
    end
end

