include("../src/blocksys.jl")
using .blocksys

(A, n, l)= readMatrix("../../data/16/A.txt");

b = rightSideVector(A, n, l);

println(gaussianElimination(A, n, l, b));
println(gaussianEliminationWithChoose(A,n,l,b));

(A, n, l)= readMatrix("../../data/16/A.txt");
b = rightSideVector(A, n, l);
println(solveLU(matrixToLU(A,n,l),n,l,b,));

(A, n, l)= readMatrix("../../data/16/A.txt");
b = rightSideVector(A, n, l);
(A, p) = matrixToLUWithChoose(A,n,l);
println(solveLUWithChoose(A,n,l,b, p));