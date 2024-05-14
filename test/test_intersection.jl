using StaticArrays
using LinearAlgebra
using Test
path = joinpath(dirname(@__DIR__),"src/")


include(joinpath(path,"core/core.jl"))
include(joinpath(path,"core/_convert.jl"))
include(joinpath(path,"func/intersection.jl"))


# Test: Line - Plane 
# Fall 1: Grundlegender Schnittpunkt
line1 = Line([1.0, 2.0, 3.0], [1.0, 1.0, 1.0])
plane1 = Plane([0.0, 0.0, 0.0], [0.0, 0.0, 1.0])
@test intersection(line1, plane1) ≈ [-2.0, -1.0, 0.0]

# Fall 2: Parallelität (kein Schnittpunkt)
line2 = Line([1.0, 2.0, 3.0], [1.0, 2.0, 3.0])
plane2 = Plane([0.0, 0.0, 0.0], [2.0, -1.0, 0.0])
@test intersection(line2, plane2) === nothing

# Fall 3: Linie auf der Ebene
line3 = Line([0.0, 0.0, 0.0], [1.0, 2.0, 3.0])
plane3 = Plane([0.0, 0.0, 0.0], [2.0, -1.0, 0.0])
@test intersection(line3, plane3) === nothing

# Fall 4: Numerische Genauigkeit
line4 = Line([1.0e-10, 2.0, 3.0], [1.0, 1.0, 1.0])
plane4 = Plane([0, 0.0, 0.0], [0.0, 0.0, 1.0])
@test intersection(line4, plane4) ≈ [-3.0,-1.0,0.0]

@info "All Test with Line and Plane are successful!"

# Test: Line - Line 
# Fall 1: Grundlegender Schnittpunkt
line1 = Line([1.0, 2.0, 3.0], [1.0, 1.0, 1.0])
line2 = Line([4.0, 5.0, 6.0], [-1.0, -1.0, 1.0])
@test intersection(line1, line2) ≈ [4.0, 5.0, 6.0]

# Fall 2: Parallelität (kein Schnittpunkt)
line3 = Line([0.0, 0.0, 0.0], [1.0, 1.0, 0.0])
line4 = Line([1.0, 1.0, 0.0], [2.0, 2.0, 0.0])
@test intersection(line3, line4) === nothing

# Fall 3: Schiefe Linien (kein Schnittpunkt)
line5 = Line([0.0, 0.0, 0.0], [1.0, 1.0, 0.0])
line6 = Line([0.0, 0.0, 1.0], [1.0, -1.0, 0.0])
@test intersection(line5, line6) === nothing


@info "All Test with Line and Line are successful!"

# Test: Line - Circle 



# Test: Line - Sphere 


# Test: Circle - Circle


# Test: Cicle - Sphere
