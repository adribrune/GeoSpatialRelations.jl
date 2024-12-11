var documenterSearchIndex = {"docs":
[{"location":"library/#FMI.jl-Library-Functions","page":"Function Library","title":"FMI.jl Library Functions","text":"","category":"section"},{"location":"library/","page":"Function Library","title":"Function Library","text":"This section lists all functions with their doc strings.","category":"page"},{"location":"library/#User-level","page":"Function Library","title":"User level","text":"","category":"section"},{"location":"library/","page":"Function Library","title":"Function Library","text":"intersection\n","category":"page"},{"location":"library/#GeoSpatialRelations.intersection","page":"Function Library","title":"GeoSpatialRelations.intersection","text":"intersection(line::Line, plane::Plane)\n\nCalculating the intersection point between a line and a plane\n\nArguments\n\nline::Line: instance of a line\nplane::Plane: instance of a plane\n\nReturns\n\nintersection_point::Vector: point of intersection\n\n\n\n\n\nintersection(line::Line, line2::Line)\n\nCalculating the intersection point between two lines \n\nArguments\n\nline1::Line: instance of a line\nline2::Line: instance of a line\n\nReturns\n\nThere are two possibilities:\n\nIf there is no intersection point, an error message is displayed.\nThere is one intersection then intersection_point::Vector is returned.\n\n\n\n\n\nintersection(line::Line, sphere::Sphere)\n\ncalculating the intersection point for a line and a sphere\n\nArguments\n\nline::Line: instance of a line\nsphere::Sphere: instance of a sphere\n\nReturns\n\nThere are three possibilities:\n\nIf there is no intersection point, an error message is displayed.\nThere is one intersection then intersection_point::Vector is returned.\nThere are two intersection then intersection_point1::Vector and intersection_point2::Vector are returned.\n\n\n\n\n\nintersection(circ1::Circle, circ2::Circle)\n\ncalculating the intersection point for two cicles\n\nArguments\n\ncirc1::Circle: instance of a circle\ncirc2::Circle: instance of a circle\n\nReturns\n\nThere are three possibilities:\n\nIf there is no intersection point, an error message is displayed.\nThere is one intersection then intersection_point::Vector is returned.\nThere are two intersection then intersection_point1::Vector and intersection_point2::Vector are returned.\n\n\n\n\n\nintersection(circ::Circle, sphere::Sphere)\n\ncalculating the intersection point for a circle and a sphere\n\nArguments\n\ncirc::Circle: instance of a circle\nsphere::Sphere: instance of a sphere\n\nReturns\n\nThere are three possibilities:\n\nIf there is no intersection point, an error message is displayed.\nThere is one intersection then intersection_point::Vector is returned.\nThere are two intersection then intersection_point1::Vector and intersection_point2::Vector are returned.\n\n\n\n\n\n","category":"function"},{"location":"#GeoSpatialRelations.jl","page":"Introduction","title":"GeoSpatialRelations.jl","text":"","category":"section"},{"location":"#What-is-GeoSpatialRelations.jl?","page":"Introduction","title":"What is GeoSpatialRelations.jl?","text":"","category":"section"},{"location":"","page":"Introduction","title":"Introduction","text":"GeoSpatialRelations.jl is a freely usable library for the Julia programming language designed to manage geometric relationships in three-dimensional space. This library provides essential functionalities for working with various geometric objects such as circles, spheres, straight lines, and planes. It enables users to compute fundamental geometric relationships between these objects, including intersections and the smallest distance.","category":"page"},{"location":"#Current-Features","page":"Introduction","title":"Current Features","text":"","category":"section"},{"location":"","page":"Introduction","title":"Introduction","text":"Intersections: Calculate intersections between geometric objects.\nSmallest Distance: Find the smallest distance between objects in space.\nMore features can be easily added and extended.","category":"page"},{"location":"#How-can-I-use-FMI.jl?","page":"Introduction","title":"How can I use FMI.jl?","text":"","category":"section"},{"location":"","page":"Introduction","title":"Introduction","text":"To use GeoSpatialRelations.jl, simply clone the repository or install it using Julia's package manager:","category":"page"},{"location":"","page":"Introduction","title":"Introduction","text":"1. Open a Julia-REPL, switch to package mode using ], activate your preferred environment.","category":"page"},{"location":"","page":"Introduction","title":"Introduction","text":"2. Install GeoSpatialRelations.jl:","category":"page"},{"location":"","page":"Introduction","title":"Introduction","text":"(@v1) pkg> add GeoSpatialRelations","category":"page"},{"location":"#General-architecture","page":"Introduction","title":"General architecture","text":"","category":"section"}]
}
