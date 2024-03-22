module Intersect3D

using LinearAlgebra
using StaticArrays

include("core/core.jl")
include("core/_convert.jl")
include("func/intersection.jl")

export circcirc, circsphere, linesphere, lineline, lineplane
end # module Intersect3D
