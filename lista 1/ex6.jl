#Mateusz Kościelniak
#indeks: 244973


#obliczanie wartości dwóch funkcji

#liczba powtórzeń
n = 200

for i in 1:n
    #wyliczenie argumentu funkcji
    x = Float64(8)^(-i)

    #obliczenie wartosci dwoch funkcji
    f = (x^2 + 1)^(-2) - 1
    g = (x ^ 2) / ((x^2 + 1)^(-2) + 1)
    
    println("8^(-", i, ")\tf(x)=", f, "\tg(x)=", g)
end