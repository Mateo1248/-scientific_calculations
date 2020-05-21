# Mateusz Kościelniak
# indeks: 244973

using SparseArrays

#=
# Funkcja obliczająca wektor prawych stron dla zadanej macierzy i wektora jednostkowego
#
# in:	
# A - macierz,
# n - rozmiar macierzy,
# l - rozmiar bloku
#
# out:	
# b - wektor prawych stron
=#
function rightSideVector(A::SparseMatrixCSC{Float64, Int64}, n::Int64, l::Int64)
    b = zeros(Float64, n)
    
	for i in 1 : n

		for j in max(Int64(l * floor((i-1) / l)) - 1, 1) : min(Int64(l + l * floor((i-1) / l)), n)
			b[i] += A[j, i]
		end

		if (i + l <= n)
			b[i] += A[i + l, i]
		end
	end
	return b
end


