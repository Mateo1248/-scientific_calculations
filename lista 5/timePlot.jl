# Mateusz Kościelniak
# indeks: 244973

include("./matrixgen/matrixgen.jl")
include("./blocksys/src/blocksys.jl")
using .matrixgen
using .blocksys


REPS = 2

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
    for size in 100:300:10000
        totalTime = 0
        totalMemory = 0

        blockmat(size, BLOCK_SIZE, 1.0, "test.txt")

        for reps in 1:REPS            
            (M, n, l) = readMatrix("test.txt")
            b = rightSideVector(M, n, l)
            (_, time, memory) = @timed ge(M, b, n, l)

            totalTime += time
        end
        print(size, " ", string(totalTime / REPS), " ")

        totalTime = 0
        for reps in 1:REPS            
            (M, n, l) = readMatrix("test.txt")
            b = rightSideVector(M, n, l)
            (_, time, memory) = @timed gewc(M, b, n, l)

            totalTime += time
        end
        print(string(totalTime / REPS), " ")

        totalTime = 0
        for reps in 1:REPS            
            (M, n, l) = readMatrix("test.txt")
            b = rightSideVector(M, n, l)
            (_, time, memory) = @timed lu(M, b, n, l)

            totalTime += time
        end
        print(string(totalTime / REPS), " ")

        totalTime = 0
        for reps in 1:REPS            
            (M, n, l) = readMatrix("test.txt")
            b = rightSideVector(M, n, l)
            (_, time, memory) = @timed luwc(M, b, n, l)

            totalTime += time
        end
        println(string(totalTime / REPS) )
    end
end

benchmark()