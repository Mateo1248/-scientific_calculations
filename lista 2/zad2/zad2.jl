#Mateusz Kościelniak
#indeks: 244973

using SymPy
using Plots
plotly()

#obliczam granice funkcji 
function comLim() 
    f(x) = (exp(x)*(log(1 + exp(-x))))
    x = symbols("x")
    println("Granica funkcji przy x dążącym do nieskończoności: ",limit(f(x), x, oo), "\n")
end


#tworze wykresy dla wszystkich typów zmiennopozycyjnych
function genPlot()

    types = [Float16, Float32, Float64]

    for type in types
        f(x) = (type(type(exp(type(x)))*(type(log(type(1) + type(exp(type(-x))))))))

        t = string(type)
        display(plot(f, -10, 50, title=t, legend=false))
    end
end

genPlot()
comLim()