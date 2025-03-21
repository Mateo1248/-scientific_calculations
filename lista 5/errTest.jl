# Mateusz Kościelniak
# indeks: 244973

include("./matrixgen/matrixgen.jl")
include("./blocksys/src/blocksys.jl")
using .matrixgen
using .blocksys

SIZES = [16, 100, 1000, 5000, 20000, 50000]

REPS = 1

BLOCK_SIZE = 4

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

function test()
    for size in SIZES         
        (A, n, l) = readMatrix("test.txt")
        b = rightSideVector(A, n, l)
        x = gewc(A, b, n, l)

        writeToFile("geErrTest.txt", x, n, true)
    end
end

test()