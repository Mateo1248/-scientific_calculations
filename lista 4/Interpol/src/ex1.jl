# Mateusz Kościelniak
# indeks: 244973

#=
# funkcja obliczająca ilorazy różnicowe dwóch wektorów
#
# x - wektor zawierający węzły x0,...xn
# f - wektor zawierający wartości interpolowanej funkcji
# fx - wektor zawierający obliczone ilorazy różnicowe
=#
function ilorazyRoznicowe(x::Vector{Float64}, f::Vector{Float64})
    
    # długość wektora
    n = length(f)    
    
    # wektor ilorazów różnicowych
    fx = Vector{Float64}(undef, n)

    # przepisanie wartości funkcji interpolowanej
    for i in 1:n
        fx[i] = f[i]
    end

    # obliczanie ilorazów różnicowych
    for i in 2:n
        for j in n:-1:i
            fx[j] = (fx[j] - fx[j - 1])/(x[j] - x[j - i + 1])
        end
    end

    return fx
end