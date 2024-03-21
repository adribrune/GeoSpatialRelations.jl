module Intersect3D

using LinearAlgebra

include("func/circcirc.jl")
include("func/circsphere.jl")

export circcirc, circsphere, linesphere, lineline, lineplane

end # module Intersect3D
