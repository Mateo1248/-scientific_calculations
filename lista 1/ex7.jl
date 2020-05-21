#Mateusz Kościelniak
#indeks: 244973


#badana funkcja
f(x) = sin(x) + cos(3 * x)

#przyblizona wartosc pochodnej
#f-badana funkcja
#h-bardzo mała liczba
#x-argument funkcji 
aprDer(f, x, h) = (f(x + h) - f(x)) / h

#wartość pochodnej
der(x) = cos(x) - 3 * sin(3 * x)

#obliczamy wartosc pochodnej
dr = der(Float64(1))

println("n\twartość dokładna\t wartość przybliżona\tbłąd\t1+h")
for n in 0:54
    #obliczamy h
    h = Float64(2)^(-n)
    #obliczamy przyblizona wartosc pochodnej
    ad = aprDer(f, Float64(1), h)
    #obliczamy bląd
    err = abs(dr - ad)

    println(n, "\t", dr, "\t", ad, "\t", err, "\t", Float64(1)+h)
end

