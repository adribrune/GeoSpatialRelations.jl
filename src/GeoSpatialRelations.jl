module GeoSpatialRelations

using LinearAlgebra
using StaticArrays

include("core/core.jl")
include("core/_convert.jl")
include("func/intersection.jl")

export intersection
end # module Intersect3D
