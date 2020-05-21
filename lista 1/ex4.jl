#Mateusz Kościelniak
#indeks: 244973


#a) szukanie takiego x, ze 1<x<2 i x*(1/x) != 1

#na poczatku biezemy najmniejsza liczbe wieksza od 1
x = nextfloat(Float64(1.0))
while Float64(x * (Float64(1.0) / x)) != Float64(1.0)
    x = nextfloat(x)
end

println("Najmniejsza liczba z przedziału (1, 2) spełniające równanie: ", x)

#b) szukanie najmniejszego x spełniającego własności z podpunktu a

y = floatmin(Float64)
while Float64(y * (Float64(1) / y)) != Float64(1)
    y = nextfloat(y)
end

println("Minimalne liczba spełniające równanie: ", y)