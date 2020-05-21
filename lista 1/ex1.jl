#Mateusz Kościelniak
#indeks: 244973


#type - Float16, Float32 and Float64
type = [Float16, Float32, Float64]

#wyliczenie interacyjne epsilonu maszynowego 
function machEps(type)
    macheps::type = 1
    while (type(1) + macheps / type(2)) > type(1)
        macheps /= type(2)
    end
    return macheps
end

#Szukanie maksymalnej wartosci zmiennej
function maxFlt(type)
    max::type = 2

    while !isinf(max * type(2))
        max *= type(2)
    end

    addend = max/type(2)

    while addend > eps(type)
        if !isinf(max + addend)
            max += addend
        end 
        addend /= type(2)
    end
    return max
end

#wyliczenie liczby eta
function eta(type)
    eta::type = type(1)
    while eta / type(2) > type(0.0)
        eta /= type(2)
    end
    println(bitstring(eta))
    return eta
end

for x in type
    println("Typ: ", x, "\n")

    println("Epsilon maszynowy")
    println("wyliczony: ", machEps(x))
    println("wudowany: ", eps(x), "\n")

    println("Liczba eta")
    println("wyliczona: ", eta(x))
    println("wudowana: ", nextfloat(x(0.0)), "\n")

    println("Maksymalna wartość")
    println("wyliczona: ", maxFlt(x))
    println("wudowana: ", floatmax(x), "\n\n")

    println(Float32(1.4e-45) == Float32(1.0e-45))
end