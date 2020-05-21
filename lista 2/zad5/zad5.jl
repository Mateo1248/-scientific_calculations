#Mateusz Kościelniak
#indeks: 244973

function p(T, cut)
    #wyniki
    result = zeros(T, 40)
    
    #warunki początkowe
    p = T(0.01)
    r = 3

    for i in 1:40
        p = p + r * p * (T(1.0) - p)

        if i==cut
            p=trunc(p,digits=3)
        end

        result[i] = p
    end

    return result
end

println("czesc pierwsza")
res1 = p(Float32, 100)
resMod1 = p(Float32, 10)
println("bez modyfikacji")
println(res1)
println("z modyfikacja")
println(resMod1)

println("\nczesc druga")
res2 = p(Float32, 100)
resMod2 = p(Float64, 100)
println("Float32")
println(res2)
println("Float64")
println(resMod2)


