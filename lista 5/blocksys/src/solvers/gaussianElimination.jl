# Mateusz Kościelniak
# indeks: 244973

using SparseArrays

#=
# Funkcja rozwiązująca układ równań liniowych metodą eliminacji Gaussa bez wyboru elementu głównego
#
# in:	
# A - macierz, 
# n - rozmiar macierzy, 
# l - wielkość bloku,
# b - wektor prawych stron
# 
# out:	
# x - rozwiązanie układu
=#
function gaussianElimination(A::SparseMatrixCSC{Float64, Int64}, n::Int64, l::Int64, b::Vector{Float64})

	# petla po kolumnach
	for k in 1 : n-1

		# ostatni niezerowy element w kolumnie
		lastRow = convert(Int64, min(l + l * floor((k+1) / l), n))

		# ostatni niezerowy element w wierszu
		lastCol = convert(Int64, min(k + l, n))

		# petla po wierszach
		for i in k + 1 : lastRow
			if abs(A[k,k]) < eps(Float64)
				error("współczynnik na diagonali równy zero.")
			end

			# mnożnik wektora
			multiplier = A[k, i] / A[k, k]

			# zerowanie pierwszego współczynnika 
			A[k, i] = 0

			# petla po kolumnach w wierszu odejmujaca kolejne składowe dwóch wektorów macierzy A
			for j in k + 1 : lastCol
				A[j, i] = A[j, i] - multiplier * A[j, k]
			end

			# korekta wyniku w wektorze prawych stron
			b[i] = b[i] - multiplier * b[k]
		end
	end

	x = Array{Float64}(undef, n)

	# podstawianie wstecz
	for i in n : -1 : 1

		prevTotal = 0.0
		lastCol = min(n, i + l)

		# sumowanie obliczonych wczesniej wartosci
		for j in i + 1 : lastCol
			prevTotal += A[j, i] * x[j]
		end

		# koncowa wartosc wspolczynnika x_i
		x[i] = (b[i] - prevTotal) / A[i, i]
	end
	return x
end


#=
# Funkcja rozwiązująca układ równań liniowych metodą eliminacji Gaussa z częściowym wyborem elementu głównego 
#
# in:	
# A - zadana macierz, 
# n - rozmiar macierzy, 
# l - wielkość bloku,
# b - wektor prawych stron
# 
# out:	
# x - rozwiązanie układu
=#
function gaussianEliminationWithChoose(A::SparseMatrixCSC{Float64, Int64}, n::Int64, l::Int64, b::Vector{Float64})

	#wektor permutacji wieszy
	permVec = collect(1:n)

	# petla po kolumnach
	for k in 1:n - 1

		# ostatni niezerowy element w kolumnie
		lastRow = convert(Int64, min(l + l * floor((k+1) / l), n))

		# ostatni niezerowy element w wierszu
		lastCol = convert(Int64, min(2*l + l * floor((k+1) / l), n))

		# petla po wierszach
		for i in k + 1 : lastRow

			maxRow = k
			max = abs(A[k,permVec[k]])

			# szukanie elementu głównego
			for x in i : lastRow
				if (abs(A[k,permVec[x]]) > max)
					maxRow = x;
					max = abs(A[k,permVec[x]])
				end
			end

			# jesli wszyskie elementy w kolumnie są zerami
			if (abs(max) < eps(Float64))
				error("nie znalezionoelementu głównego - macierz osobliwa.")
			end

			# zamiana wierszy w macierzy permutacji
			permVec[k], permVec[maxRow] = permVec[maxRow], permVec[k]

			# mnożnik wektora
			multiplier = A[k,permVec[i]] / A[k,permVec[k]]

			# zerowanie pierwszego współczynnika 
			A[k,permVec[i]] = 0

			# petla po kolumnach w wierszu odejmujaca kolejne składowe dwóch wektorów macierzy A
			for j in k + 1 : lastCol
				A[j,permVec[i]] = A[j,permVec[i]] - multiplier * A[j,permVec[k]]
			end

			# korekta wyniku w wektorze prawych stron
			b[permVec[i]] = b[permVec[i]] - multiplier * b[permVec[k]]
		end
	end

	x = Array{Float64}(undef, n)

	# podstawianie wstecz
	for i in n : -1 : 1
		prevTotal = 0.0
		lastCol = convert(Int64, min(2*l + l*floor((permVec[i]+1)/l), n))

		# sumowanie obliczonych wczesniej wartosci
		for j in i + 1 : lastCol
			prevTotal += A[j,permVec[i]] * x[j]
		end
		
		# koncowa wartosc wspolczynnika x_i
		x[i] = (b[permVec[i]] - prevTotal) / A[i, permVec[i]]
	end
	return x
end