#Mateusz Kościelniak
#indeks: 244973

using SymPy
using Plots
plotly()


#funkcja realizująca równanie z zadanymi wartościami początkowymi
function x(x0, c)
    results = zeros(Float64, 100)
    x = Float64(x0)

    for i in 1:100
        x = x^2 + c

        results[i] = x
    end

    return results
end

#wartości początkowe postaci [x0, c]
intitVals = [
    [Float64(-2), Float64(1)],
    [Float64(-2), Float64(2)],
    [Float64(-2), Float64(1.99999999999999)],
    [Float64(-1), Float64(1)],
    [Float64(-1), Float64(-1)],
    [Float64(-1), Float64(0.75)],
    [Float64(-1), Float64(0.25)]
]

#zastosowanie funkcji dla wszystkich wartości początkowych
results = []
for i in 1:length(intitVals)
    push!(results, x(intitVals[i][2], intitVals[i][1]))
end

#zapisa danych do pliku

for i in 1:length(results)

    fileName = string("data_", i, ".txt")
    io = open(fileName, "w")
    for j in 1:length(results[i])
        println(io, string(results[i][j]))
    end
    close(io)
end


#wyswietlenie wykresow


for i in 1:length(results)

    y = results[i]

    title = string("x=", intitVals[i][2], " c=", intitVals[i][1])

    display(plot(1:100, y, title=title, legend=false))
end

