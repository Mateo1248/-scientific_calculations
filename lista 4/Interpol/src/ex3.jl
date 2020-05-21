# Mateusz Kościelniak
# indeks: 244973

#=
# funkcja obliczająca współczynniki wielomianu interpolacyjnego w postaci 
# Newtona dla postaci normlanej
#
# x – wektor długości n + 1 zawierający węzły x0, . . . , xn
# fx – wektor długości n + 1 zawierający ilorazy różnicowe
# a – wektor długości n + 1 zawierający obliczone współczynniki postaci naturalnej
=#
function naturalna(x::Vector{Float64}, fx::Vector{Float64})

    # długość wektorów
    n = length(x)

    # wektor współczynników    
    a = Vector{Float64}(undef, n)

    # ostatni iloraz różnicowy
    a[n] = fx[n]

    # obliczanie pozostałych ilorazów różnicowych
    for i = n - 1:-1:1
        a[i] = fx[i] - a[i + 1] * x[i]

        for j = i + 1:n - 1
            a[j] = a[j] - a[j + 1] * x[i]
        end
    end

    return a
end