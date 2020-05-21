#Mateusz Kościelniak
#indeks: 244973


delta = Float64(2)^(-52)

#funkcja wypisuje kolejno n liczbwiekszych od min oddalonych od siebie o wartsc delta
function deltaPrint(min, delta, n)
    for i in 1:n
        min += delta
        println(bitstring(min))
    end
end

println("od 1")

deltaPrint(1, delta, 5)

println("od 0.5")

deltaPrint(0.5, delta, 5)

println("od 2")

deltaPrint(2, delta, 5)

