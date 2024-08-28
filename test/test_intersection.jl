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
# Fall 1: Kein Schnittpunkt
line1 = Line([0.0, 0.0, 0.0], [1.0, 0.0, 0.0])
sphere1 = Sphere([5.0, 5.0, 5.0], 1.0)
@test intersection(line1, sphere1) === (nothing,nothing)

# Fall 2: Tangentialer Schnittpunkt
line2 = Line([0.0, 0.0, 0.0], [1.0, 0.0, 0.0])
sphere2 = Sphere([1.0, 1.0, 0.0], 1.0)
@test intersection(line2, sphere2) ≈ [1.0, 0.0, 0.0]

# Fall 3: Zwei Schnittpunkte
line3 = Line([8.0, 3.0, -4.0], [1.0, 1.0, 1.0])
sphere3 = Sphere([2.0,3.0,-4.0], 6.0)
intersections = intersection(line3, sphere3)
@test length(intersections) == 2
@test intersections[1] ≈ [8.0, 3.0, -4.0]
@test intersections[2] ≈ [4.0, -1.0, -8.0]

@info "All Test with Line and Line are successful!"



# Test: Circle - Circle
# Fall 1: Keine Schnittpunkte
circ1 = Circle([0.0, 0.0, 0.0], 1.0, [0.0, 0.0, 1.0])
circ2 = Circle([5.0, 0.0, 0.0], 1.0, [0.0, 0.0, 1.0])
@test intersection(circ1, circ2) === (nothing,nothing)

@info "All Test with Line and Line are successful!"


# Fall 2: Tangentiale Schnittpunkte
circ3 = Circle([0.0, 0.0, 0.0], 1.0, [0.0, 0.0, 1.0])
circ4 = Circle([2.0, 0.0, 0.0], 1.0, [0.0, 0.0, 1.0])
p1, _ = intersection(circ3, circ4)
@test p1 ≈ [-1.0, 0.0, 0.0]

# Fall 3: Zwei Schnittpunkte
circ5 = Circle([0.0, 0.0, 0.0], 2.0, [0.0, 0.0, 1.0])
circ6 = Circle([2.0, 0.0, 0.0], 2.0, [0.0, 0.0, 1.0])
p1, p2 = intersection(circ5, circ6)
@test p1 ≈ [1.0, sqrt(3.0), 0.0] || p1 ≈ [1.0, -sqrt(3.0), 0.0]
@test p2 ≈ [1.0, -sqrt(3.0), 0.0] || p2 ≈ [1.0, sqrt(3.0), 0.0]

# Fall 4: Nicht im selben Raum
circ7 = Circle([0.0, 0.0, 0.0], 1.0, [0.0, 0.0, 1.0])
circ8 = Circle([0.0, 0.0, 0.0], 1.0, [1.0, 0.0, 0.0])
@test intersection(circ7, circ8) === (nothing,nothing)


@info "All Test with Line and Line are successful!"


# Test: Cicle - Sphere
# Fall 1: Kein Schnittpunkt
circ1 = Circle([0.0, 0.0, 0.0], 1.0, [0.0, 0.0, 1.0])
sphere1 = Sphere([5.0, 0.0, 0.0], 1.0)
@test intersection(circ1, sphere1) === (nothing, nothing)
intersection(circ1, sphere1)

# Fall 2: Tangentialer Schnittpunkt
circ3 = Circle([0.0, 0.0, 0.0], 1.0, [0.0, 0.0, 1.0])
sphere3 = Sphere([0.0, 0.0, 1.5], 1.5)
p1, _ = intersection(circ3, sphere3)
@test intersection(circ3, sphere3) == ([0.0,0.0,1.5], nothing)



# Fall 3: Zwei Schnittpunkte
circ2 = Circle([0.0, 0.0, 0.0], 1.0, [0.0, 0.0, 1.0])
sphere2 = Sphere([1.0, 0.0, 0.0], 1.0)
p1, p2 = intersection(circ2, sphere2)
@test length(p1) == 3
@test length(p2) == 3

@info "All Test with Line and Line are successful!"
