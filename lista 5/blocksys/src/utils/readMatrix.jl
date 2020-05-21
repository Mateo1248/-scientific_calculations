# Mateusz Kościelniak
# indeks: 244973

using SparseArrays

#=
# Funkcja czytająca macierz pliku
#
# in:
# filePath - scieżka do pliku
#
# out:
# A - macierz,
# n - rozmiar,
# l - wielkość bloku
=#
function readMatrix(filePath::String)
	open(filePath) do file
		ln = split(readline(file))
		n = parse(Int64, ln[1])
		l = parse(Int64, ln[2])

		nonZeroEl = n*l + 3*(n-l)

		a = Array{Int64}(undef, nonZeroEl)
		b = Array{Int64}(undef, nonZeroEl)
		c = Array{Float64}(undef, nonZeroEl)
		
		counter = 1
		while !eof(file)
			ln = split(readline(file))
			a[counter] = parse(Int64, ln[1])
			b[counter] = parse(Int64, ln[2])
			c[counter] = parse(Float64, ln[3])
			counter += 1
		end
		A = sparse(b, a, c)
		return (A, n, l)
	end
end