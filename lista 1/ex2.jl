#Mateusz Kościelniak
#indeks: 244973


#Czy wartosc epsilonu maszynowego da sie aproksymowac 
#wyrażeniem 3 * (4 / 3 - 1) - 1
type = [Float16, Float32, Float64]

for x in type 
    println("Typ: ", x, "\n")
    println("Epsilon maszynowy")
    println("aproksymowany wyrażeniem Kahana: ", abs(x(3) * (x(4) / x(3) - x(1)) - 1))
    println("wyliczony: ", eps(x))
end