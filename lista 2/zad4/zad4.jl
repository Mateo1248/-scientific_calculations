#Mateusz Kościelniak
#indeks: 244973

using Polynomials

#współczynniki wielomianu wilkinsona w formie naturalnej
p=Float64[1, 
-210.0,
20615.0,
-1256850.0,
53327946.0,
-1672280820.0,
40171771630.0,
-756111184500.0,          
11310276995381.0, 
-135585182899530.0,
1307535010540395.0,     
-10142299865511450.0,
63030812099294896.0,     
-311333643161390640.0,
1206647803780373360.0,     
-3599979517947607200.0,
8037811822645051776.0,      
-12870931245150988800.0,
13803759753640704000.0,      
-8752948036761600000.0,
2432902008176640000.0]

#do użycia Poly() musimy odwrócić współczynniki
p = p[end:-1:1]

#wielomian
naturalPolynomial = Poly(p)

#pierwiastki wielomianu P
pRoots = Float64[1.0, 2.0, 3.0, 4.0, 5.0, 6.0, 7.0, 8.0, 9.0, 10.0, 11.0, 12.0, 13.0,14.0, 15.0, 16.0, 17.0, 18.0, 19.0, 20.0]

#wielomian w postaci ioczynowej
rootsPolynomial = poly(pRoots)

#obliczenie pierwiastków za pomocą funkcji roots
calculatedRoots = roots(naturalPolynomial)

#posoruj tablice rosnąco
sort!(calculatedRoots)

println("#################################")
println("##########  bez zmiany  #########")
println("#################################")
println()
#sprawdzenie wartości pierwiastków
for k in 1:length(calculatedRoots)
    println("z= ", calculatedRoots[k])
    println("|P(z)|= ", abs(polyval(naturalPolynomial ,calculatedRoots[k])))
    println("|p(z)|= ", abs(polyval(rootsPolynomial, calculatedRoots[k])))
    println("|z-k|= ", abs(calculatedRoots[k]-k))
    println()
end


println("#################################")
println("###########  ze zmianą  #########")
println("#################################")
println()

#zamiana współczynnika
pMod = copy(p)
pMod[length(pMod)-1] = -210.0 - (1.0/(2.0^23))

#wielomian
naturalModPolynomial = Poly(pMod)

#pierwiastki
calculatedModRoots = roots(naturalModPolynomial)

calculatedModRoots = calculatedModRoots[end:-1:1]

#sprawdzenie wartości pierwiastków
for k in 1:length(calculatedModRoots)
    println("z= ", calculatedModRoots[k])
    println("|P(z)|= ", abs(polyval(naturalModPolynomial ,calculatedModRoots[k])))
    println("|p(z)|= ", abs(polyval(rootsPolynomial, calculatedModRoots[k])))
    println("|z-k|= ", abs(calculatedModRoots[k]-k))
    println()
end
