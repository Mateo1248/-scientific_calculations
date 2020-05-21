include("./matrixgen/matrixgen.jl")
include("./blocksys/src/blocksys.jl")
using .matrixgen
using .blocksys

function ge(A, b, n, l)
    gaussianElimination(A,n,l,b)
end

function gewc(A, b, n, l)
    gaussianEliminationWithChoose(A, n, l, b)
end

function lu(A, b, n, l)
    A = matrixToLU(A, n, l)
    solveLU(A,n,l,b)
end

function luwc(A, b, n, l)
    (A, p) = matrixToLUWithChoose(A, n, l)
    solveLUWithChoose(A, n, l, b, p)
end

(A, n, l) = readMatrix("./data/50.000/A.txt")
b = rightSideVector(A, n, l)

@time (x = luwc(A, b, n, l))

writeToFile("testLab.txt", x, n, true)
