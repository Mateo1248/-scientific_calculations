# Mateusz Kościelniak
# indeks: 244973

##############################################################################
# Funkcja oblicza miesjce zerowe podanej funkcji f za pomocą metody Newtona
# f, pf - dana funkcja i jej pochodna
# x0 - przybliżenie początkowe
# delta, epsilon - dokładności obliczeń
# maxit - maksymalna dopuszczalna liczba iteracji

function mstycznych(f,pf,x0::Float64, delta::Float64, epsilon::Float64, maxit::Int)

    v::Float64 = f(x0)

    if abs(v) < epsilon
        return x0, v, 0, 0
    end

    if  abs(pf(x0)) < delta
        return 0, 0, 0, 2 
    end

    for iterator in 1:maxit
        x1::Float64 = x0 - v / pf(x0)
        v = f(x1)

        if  abs(pf(x1)) < delta
            return 0, 0, 0, 2 
        end

        if abs(x1-x0)  < delta || abs(v) < epsilon
            return x1, v, iterator, 0
        end
        x0 = x1
    end

    return 0, 0, 0, 1
end