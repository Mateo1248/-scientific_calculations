# Mateusz Kościelniak
# indeks: 244973

using LinearAlgebra

#=
# Funkcja zapisująca rozwiązanie do pliku
#
# in:	
# filePath - ścieżka do pliku zapisowego, 
# x - wektor z rozwiązaniem,
# n - rozmiar macierzy, 
# writeErr - wybór zapisu błędu względnego
=#
function writeToFile(filePath::String, x::Array{Float64}, n::Int64, writeErr::Bool)
	open(filePath, "w") do file
		if (writeErr)
			relativeErr = norm(ones(n) - x) / norm(x)
			println(relativeErr)
			println(file, relativeErr)
		end
		
		for i in 1 : n
			println(file, x[i])
		end
	end
end