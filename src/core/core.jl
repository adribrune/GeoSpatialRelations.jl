abstract type AbstractSpatial end


abstract type AbstractLine <: AbstractSpatial end 
abstract type AbstractPlane <: AbstractSpatial end 


for (type, supertype) in zip([:Line, :Plane], [:AbstractLine, :AbstractPlane])

    @eval struct $type{N,T} <: $supertype

        point::SVector{N,T}
        vector::SVector{N,T}


        function $type(point::SVector{N,T}, vector::SVector{N,T};kwargs...) where {N,T}
            if is_zero(vector; kwargs...)
                throw(ArgumentError("The vector must have a non-zero magnitude."))
            end
            inst = new{N,T}()
            inst.point = point
            inst.vector = vector

            return inst

        end
    end
end


abstract type AbstractSphere <: AbstractSpatial end
abstract type AbstractCircle <: AbstractSpatial end

struct Sphere{N,T} <: AbstractSphere 

    center::SVector{N, T} 
    radius::Real

    function Sphere(center::SVector{N,T} , radius::Real ) where {N,T}
        if radius <= 0
            throw(ArgumentError("A negative radius is not permitted."))
        end

        if N != 3 
            throw(ArgumentError("A spatial description only possible in dim = 3."))
        end 


        inst = new{N,T}()

        inst.center = center
        inst.radius = radius
        return inst
    end
end

function Sphere(point::AbstractVector, radius::Real)
    point_static = abstractvec_to_svector(point)
    return Sphere(point_static, radius)
end

struct Circle{N,T} <: AbstractSphere 

    center::SVector{N, T} 
    radius::Real
    normal::SVector{N, T}

    function Circle(center::SVector{N,T} , radius::Real, normal::SVector{N, T}) where {N,T}
        println("da")
        if radius <= 0
            throw(ArgumentError("A negative radius is not permitted."))
        end

        if N != 3 
            throw(ArgumentError("A spatial description only possible in dim = 3."))
        end 


        new{N,T}(center, radius, normal)
    end

end



function Circle(point::AbstractVector, radius::Real, normal::AbstractVector)
    point_static = abstractvec_to_svector(point)
    normal_static = abstractvec_to_svector(normal)
    return Circle(point_static, radius, normal_static)
end
