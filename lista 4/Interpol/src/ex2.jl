# Mateusz Kościelniak
# indeks: 244973

#=
# funkcja oliczająca wartości wielomianu interpolacyjnego stopnia n
# w postaci Newtona w punkcie t za pomocą uogólnionego algorytmu Hornera
#
# x – wektor długości n + 1 zawierający węzły x0, . . . , xn
# fx – wektor długości n + 1 zawierający ilorazy różnicowe
# t – punkt, w którym należy obliczyć wartość wielomianu
# nt wartość wielomianu w punkcie t
=#

function warNewton(x::Vector{Float64}, fx::Vector{Float64}, t::Float64)

    # długość wektorów
    n = length(fx)

    # wartość wielomianu w punkcie t
    nt = fx[n]

    #   obliczanie wartości wielomianu w punkcie
    for i in n-1:-1:1
        nt = fx[i]+(t-x[i])*nt
    end

    return nt
end