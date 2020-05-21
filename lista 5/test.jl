# Mateusz Kościelniak
# indeks: 244973

include("./matrixgen/matrixgen.jl")
include("./blocksys/src/blocksys.jl")
using .matrixgen
using .blocksys

SIZES = [16, 100, 1000, 5000, 10000, 20000, 50000]

REPS = 4

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


function benchmark()
    for size in SIZES
        totalTime = 0
        totalMemory = 0

        blockmat(size, BLOCK_SIZE, 1.0, "test.txt")

        for reps in 1:REPS            
            (M, n, l) = readMatrix("test.txt")
            b = rightSideVector(M, n, l)
            (_, time, memory) = @timed luwc(M, b, n, l)

            totalTime += time
            totalMemory += memory/1024.0
        end
        println(size, " & ", string(totalTime / REPS), " s & ", string(totalMemory / REPS), " KiB &")
    end
end

benchmark()