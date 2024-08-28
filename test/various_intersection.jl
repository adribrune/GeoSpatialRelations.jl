using StaticArrays
include("C:/Users/bruneadr/repos/GeoSpatialRelations.jl/src/core/core.jl")
include("C:/Users/bruneadr/repos/GeoSpatialRelations.jl/src/core/_convert.jl")
include("C:/Users/bruneadr/repos/GeoSpatialRelations.jl/src/func/intersection.jl")



# Testfunktion für Line und Plane
function test_line_and_plane()
    # Test Line
    @info "Testing Line..."
    point = [0.0, 0.0, 0.0]
    direction = [1.0, 1.0, 1.0]
    line = Line(point, direction)
    @assert line.point == SVector(0.0, 0.0, 0.0)
    @assert line.direction == SVector(1.0, 1.0, 1.0)

    # Test Plane
    @info "Testing Plane..."
    point = [0.0, 0.0, 0.0]
    normal = [0.0, 0.0, 1.0]
    plane = Plane(point, normal)
    @assert plane.point == SVector(0.0, 0.0, 0.0)
    @assert plane.normal == SVector(0.0, 0.0, 1.0)

    @info "Testing intersection function..."
    sect = intersection(line, plane)

    @info "All tests passed successfully!"
end

test_line_and_plane()


# Testfunktion für Line und Line
function test_line_and_line()
  # Testfall 1: Parallele Linien
  line1 = Line([0.0, 0.0, 0.0], [1.0, 1.0, 1.0])
  line2 = Line([1.0, 1.0, 1.0], [2.0, 2.0, 2.0])
  #try
  #    intersection(line1, line2)
  #    @assert false  # Es sollte eine Fehlermeldung ausgelöst werden
  #catch e
  #    @assert isa(e, ArgumentError)
  #    @assert occursin("Both directional vectors have the same direction.", e.msg)
  #end
  #
  # Testfall 2: Schneidende Linien
  line1 = Line([0.0, 0.0, 0.0], [1.0, 1.0, 1.0])
  line2 = Line([0.0, 1.0, 1.0], [1.0, 0.0, 0.0])
  expected_intersection = [0.5, 0.5, 0.5]
  @assert isapprox(intersection(line1, line2), expected_intersection)
  
  # Testfall 3: Schiefe Linien
  line1 = Line([0.0, 0.0, 0.0], [1.0, 1.0, 1.0])
  line2 = Line([0.0, 1.0, 1.0], [2.0, 0.0, 0.0])
  try
      intersection(line1, line2)
      @assert false  # Es sollte eine Fehlermeldung ausgelöst werden
  catch e
      @assert isa(e, ArgumentError)
      @assert occursin("The given arguments are skew lines", e.msg)
  end
end

test_line_and_line()
