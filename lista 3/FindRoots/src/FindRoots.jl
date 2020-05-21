#Mateusz Kościelniak
#indeks: 244973

#Moduł zawierający funkcje do obliczania pierwiatków funkcji
#metodami bisekcji, stycznych oraz siecznych.

module FindRoots
    export mbisekcji, msiecznych, mstycznych

    include("mbisekcji.jl")                
    include("mstycznych.jl")             
    include("msiecznych.jl")
end

