abstract type AbstractSpatial end


abstract type AbstractLine <: AbstractSpatial end 
abstract type AbstractPlane <: AbstractSpatial end 


for (type, supertype) in zip([:Line, :Plane], [:AbstractLine, :AbstractPlane])

    if type == :Line
        vector = :direction
    elseif type == :Plane
        vector = :normal
    end

    @eval struct $type{N,T} <: $supertype


        point::SVector{N,T}
        $vector::SVector{N,T}


        function $type(point::SVector{N,T}, vector::SVector{N,T};kwargs...) where {N,T}
            new{N,T}(point, vector)
        end
    end

    @eval function $type(point::AbstractVector, vector::AbstractVector;kwargs...)
        point_static = abstractvec_to_svector(point)
        vector_static = abstractvec_to_svector(vector)
        return $type(point_static, vector_static; kwargs...)
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

    new{N,T}(center,radius)
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
