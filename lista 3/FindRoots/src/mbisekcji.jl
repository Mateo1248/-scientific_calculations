# Mateusz Kościelniak
# indeks: 244973

##############################################################################
# Funkcja oblicza miesjce zerowe podanej funkcji f za pomocą metody bisekcji
# f - dana funkcja
# a, b - końce przedziału początkowego
# delta, epsilon - dokładności obliczeń

function mbisekcji(f, a::Float64, b::Float64, delta::Float64, epsilon::Float64)

    iterator::Int64 = 0
    u::Float64 = f(a)
    v::Float64 = f(b)
    e::Float64 = b-a

    if sign(u) == sign(v)
        return 0, 0, 0, 1
    end
    

    while true
        iterator += 1
        
        e /= 2
        c::Float64 = a + e
        w::Float64 = f(c)

        if abs(e) < delta || abs(w) < epsilon
            return c, w, iterator, 0
        end

        if sign(w) != sign(u)
            b = c
            v = w
        else
            a = c
            u = w
        end
    end 
end