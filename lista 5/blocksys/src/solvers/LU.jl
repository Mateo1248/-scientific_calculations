# Mateusz Kościelniak
# indeks: 244973

#=
# Funkcja obliczająca rozkład LU bez wyboru elementu głównego 
#
# in:	
# A - zadana macierz, 
# n - rozmiar macierzy, 
# l - wielkość bloku
#
# out:
# A - macierz zawierająca rozkład LU
=#
function matrixToLU(A::SparseMatrixCSC{Float64, Int64}, n::Int64, l::Int64)
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
            
            # wypełnienie macierzy L
            A[k, i] = multiplier
            
            # petla po kolumnach w wierszu odejmujaca kolejne składowe dwóch wektorów macierzy A
			for j in k + 1 : lastCol
				A[j, i] = A[j, i] - multiplier * A[j, k]
			end
		end
    end
    
    return A
end

#=
# Funkcja rozwiązująca układ równań liniowych z rozkładu LU stworzonego bez wyboru elementu głównego
# in:	
# A - macierz w rozkładzie LU, 
# n - rozmiar macierzy, 
# l - wielkość bloku,
# b - wektor prawych stron
#
# out:	
# x - rozwiązanie układu
=#
function solveLU(A::SparseMatrixCSC{Float64, Int64}, n::Int64, l::Int64, b::Vector{Float64})
    
    # podstawianie w przód
    z = Array{Float64}(undef, n)
    for i in 1 : n
        
		prevTotal = 0.0
        minCol = convert(Int64, max(l * floor((i-1) / l) - 1, 1))
        
		for j in minCol : i-1
			prevTotal += A[j, i] * z[j]
		end
		z[i] = b[i] - prevTotal
	end

    # podstawianie wstecz
	x = Array{Float64}(undef, n)
    for i in n : -1 : 1
        
		prevTotal = 0.0
		lastCol = min(n, i + l)
		for j in i + 1 : lastCol
			prevTotal += A[j, i] * x[j]
		end
		x[i] = (z[i] - prevTotal) / A[i, i]
	end
	return x
end

#=
# Funkcja obliczająca rozkład LU z częściowym wyborem elementu głównego
#
# in:	
# A - zadana macierz, 
# n - rozmiar macierzy, 
# l - wielkość bloku
#
# out:	
# A - macierz zawierająca rozkład LU
# permVec - wektor permutacji wierszy
=#
function matrixToLUWithChoose(A::SparseMatrixCSC{Float64, Int64}, n::Int64, l::Int64)
	permVec = collect(1:n)

    for k in 1:n - 1
        
		lastRow = convert(Int64, min(l + l * floor((k+1) / l), n))
        lastCol = convert(Int64, min(2*l + l*floor((k+1)/l), n))
        
        for i in k + 1 : lastRow
            
			maxRow = k
            max = abs(A[k,permVec[k]])
            
			for x in i : lastRow
				if (abs(A[k,permVec[x]]) > max)
					maxRow = x;
					max = abs(A[k,permVec[x]])
				end
            end
            
			if (abs(max) < eps(Float64))
				error("nie znalezionoelementu głównego - macierz osobliwa.")
			end
            
            permVec[k], permVec[maxRow] = permVec[maxRow], permVec[k]
			z = A[k,permVec[i]] / A[k,permVec[k]]
			A[k,permVec[i]] = z

            for j in k + 1 : lastCol
				A[j,permVec[i]] = A[j,permVec[i]] - z * A[j,permVec[k]]
			end
		end
	end
	return (A, permVec)
end

#=
# Funkcja rozwiązująca układ równań liniowych z rozkładu LU stworzonego z częściowym wyborem elementu głównego
# 
# in:	
# A - macierz w rozkładzie LU, 
# n - rozmiar macierzy, 
# l - wielkość bloku,
# b - wektor prawych stron, 
# permVec - wektor permutacji wierszy
#
# out:	
# x - rozwiązanie układu
=#
function solveLUWithChoose(A::SparseMatrixCSC{Float64, Int64}, n::Int64, l::Int64, b::Vector{Float64}, permVec::Vector{Int64})
    z = Array{Float64}(undef, n)
    
	for i in 1 : n
		prevTotal = 0.0
        minCol = convert(Int64, max(l * floor((permVec[i]-1) / l) - 1, 1))
        
		for j in minCol : i-1
			prevTotal += A[j, permVec[i]] * z[j]
		end
		z[i] = b[permVec[i]] - prevTotal
	end

	x = Array{Float64}(undef, n)
	for i in n : -1 : 1
		prevTotal = 0.0
        lastCol = convert(Int64, min(2*l + l*floor((permVec[i]+1)/l), n))
        
		for j in i + 1 : lastCol
			prevTotal += A[j, permVec[i]] * x[j]
		end
		x[i] = (z[i] - prevTotal) / A[i, permVec[i]]
	end
	return x
end
