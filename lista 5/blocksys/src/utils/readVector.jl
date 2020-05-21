# Mateusz Kościelniak
# indeks: 244973

#=
# Funkcja wczytująca wektor prawych stron z pliku
#
# in:	
# filePath - ścieżka do pliku z wektorem
#
# out:	
# b - wczytany wektor
=#
function readVector(filePath::String)
	open(filePath) do file
		n = parse(Int64, readline(file))
        b = Array{Float64}(undef, n)
        
		iterator = 0
		while !eof(file)
			iterator += 1
			b[iterator] = parse(Float64, readline(file))
		end
		return b
	end
end