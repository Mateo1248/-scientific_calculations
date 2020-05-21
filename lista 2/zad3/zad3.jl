#Mateusz Kościelniak
#indeks: 244973

include("matcond.jl")
include("hilbert.jl")

#eliminacja gaussa
#A-macierz, b-wektor
gaussEl(A, b) = A \ b

#obliczenie błedu
#x, y-wektory
errApr(x, y) = norm(x-y)/norm(y)  

#arytmetyka
T = Float64

n = [5, 10, 20]
c = [T(1), T(10), T(1e3), T(1e7), T(1e12), T(1e16)]
max = 20

#funkcja wypisująca rezultat obliczeń dla macierzy hilberta
function hilbMat()

    println("#################################")
    println("######  macierz hilberta  #######")
    println("#################################\n")
    #maksymalny stopien macierzy

    for nn = 1:max

        A = hilb(nn)
        x = ones(T, nn)
        b = A*x

        #eliminacja gaussa
        gaussResult = gaussEl(A, b)
        #metoda inwersji
        invResult = inv(A)*b

        println("rozmiar macierzy: ", nn)
        println("rząd macierzy: ", rank(A)) 
        println("wskażnik uwarunkowania: ", cond(A))   
        println("błąd względny wyniku")
        println("eliminacja gaussa: ", errApr(gaussResult, x))
        println("metoda inwersji: ", errApr(invResult, x))
        println()
    end
end

#funkcja wypisująca rezultat obliczeń dla losowej macierzy
function randMat()

    println("#################################")
    println("#######  macierz losowa  ########")
    println("#################################\n")

    for i = 1:length(n)
        for j = 1:length(c)
            A = matcond(n[i], c[j])
            x = ones(Float64, n[i])
            b = A*x
    
            #eliminacja gaussa
            gaussResult = gaussEl(A, b)
            #metoda inwersji
            invResult = inv(A)*b
    
            println("rozmiar macierzy: ", n[i])
            println("rząd macierzy: ", rank(A)) 
            println("wskażnik uwarunkowania: ", c[j])   
            println("błąd względny wyniku")
            println("eliminacja gaussa: ", errApr(gaussResult, x))
            println("metoda inwersji: ", errApr(invResult, x))
            println()
        end
    end
end

hilbMat()
randMat()