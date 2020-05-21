# Mateusz Kościelniak
# indeks: 244973

##############################################################################
# Funkcja oblicza miesjce zerowe podanej funkcji f za pomocą metody siecznych
# f - dana funkcja 
# x0, x1 - przybliżenia początkowe
# delta, epsilon - dokładności obliczeń
# maxit - maksymalna dopuszczalna liczba iteracji

function msiecznych(f, x0::Float64, x1::Float64, delta::Float64, epsilon::Float64, maxit::Int)

    fx0::Float64 = f(x0)
    fx1::Float64 = f(x1)

    for  iterator in 1:maxit

        if abs(fx0) > abs(fx1)
            x0, x1 = x1, x0
            fx0, fx1 = fx1, fx0
        end

        s::Float64 = (x1 - x0) / (fx1 - fx0)
        x1 = x0
        fx1 = fx0
        x0 -= fx0 * s
        fx0 = f(x0)

        if abs(x1-x0) < delta || abs(fx0) < epsilon
            return x0, fx0, iterator, 0
        end
    end

    return 0, 0, 0, 1
end