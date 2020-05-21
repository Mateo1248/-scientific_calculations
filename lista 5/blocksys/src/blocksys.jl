# Mateusz Kościelniak
# indeks: 244973

#=
# Moduł z metodami rozwiązującymi układ równań liniowych z zadaną macierzą
# oraz narzędziami ułatiwiającymi 
=#
module blocksys
    export readMatrix, readVector, writeToFile, rightSideVector, 
           gaussianElimination, gaussianEliminationWithChoose,
           solveLU, solveLUWithChoose, matrixToLU, matrixToLUWithChoose

    #utils
    include("./utils/readMatrix.jl")
    include("./utils/readVector.jl")
    include("./utils/writeToFile.jl")
    include("./utils/rightSideVector.jl")

    #solvers
    include("./solvers/gaussianElimination.jl")
    include("./solvers/LU.jl")
end 