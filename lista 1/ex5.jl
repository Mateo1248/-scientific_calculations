#Mateusz Kościelniak
#indeks: 244973


#dla każdej z poniższych funkcji
#x,y-wektory 5-elementowe
#type-typ zmiennej float 


#funkcja a
function forwardMultip(x, y, type)
    sum::type = type(0)
    for i in 1:length(x)
        sum += x[i]*y[i]
    end
    return sum
end

#funkcja b
function backwardMultip(x, y, type)
    sum::type = type(0)
    for i in Iterators.reverse(1:length(x))
        sum += x[i]*y[i]
    end
    return sum
end

#funkcja c i d
#desc-wartość true dla sortowania malejącego, false dla rosnącego
function sortedMultip(x, y, type, desc)
    
    #liczenie iloczynow 
    #z - tablica iloczynow
    z = type[0, 0, 0, 0, 0]
    for i in 1:length(x)
        z[i] = x[i]*y[i]
    end

    #sortowanie y
    if desc
        sort!(z, rev=true)
    else
        sort!(z)
    end

    #obliczanie sum czesciowych
    biggerThanZ::type = 0
    smallerThanZ::type = 0

    for i in 1:length(z)
        if z[i] > 0
            biggerThanZ += z[i]
        else
            smallerThanZ += z[i]
        end
    end
    return biggerThanZ+smallerThanZ
end


type = [Float32, Float64]
correctRes = Float64(-1.00657107000000*10^(-11))

for x in type
    v1 = x[2.718281828, -3.141592654, 1.414213562, 0.5772156649, 0.3010299957]
    v2 = x[1486.2497, 878366.9879, -22.37492, 4773714.647, 0.000185049]
    println("\n", x, "\n")
    println("wynik")
    a = forwardMultip(v1, v2, x)
    println("a: ", a)
   
    b = backwardMultip(v1, v2, x)
    println("b: ", b)

    c = sortedMultip(v1, v2, x, true)
    println("c: ", c)

    d = sortedMultip(v1, v2, x, false)
    println("d: ", d)

    println("\nblad")
    println("a: ", abs(correctRes-a))
    println("b: ", abs(correctRes-b))
    println("c: ", abs(correctRes-c))
    println("d: ", abs(correctRes-d))
end