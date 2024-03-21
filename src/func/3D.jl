"""
    lineplane(support_point_line::Vector{Float64}(def,3), direction::Vector{Float64}(def,3), normal::Vector{Float64}(def,3),support_point_plane::Vector{Float64}(def,3))

    calculate the intersection point between a line and a plane

    !only 3 dimensional vector as arguemnts

# Arguments
- support_point_line::Vector{Float64}(def,3): support vector p of a line (f(r) = p + x v)
- direction::Vector{Float64}(def,3): direction vector v of a line (f(r) = p + x v)
- normal::Vector{Float64}(def,3): nomral vector of a plane (E: n (x-p) = 0)
- support_point_plane::Vector{Float64}(def,3): support verctor p of a plan (E: n (x-p) = 0)

# Returns
- intersection_point::Vector{Float64}(def,3): intersection point between a line and a plane 

"""
function lineplane(support_point_line::Vector{Float64}, direction::Vector{Float64}, normal::Vector{Float64},support_point_plane::Vector{Float64})

    x = dot(normal, support_point_plane .- support_point_line) / dot(normal, direction)

    intersection_point = support_point_line .+ x * direction

    return intersection_point

end


"""
    lineline(support_point_line1::Vector{Float64}, direction1::Vector{Float64},support_point_line2::Vector{Float64}, direction2::Vector{Float64})

    calculate the intersection point between a line and a line

    !only 3 dimensional vector as arguemnts

# Arguments
- support_point_line1::Vector{Float64}(def,3): support vector p of a line (f(r) = p + x v)
- direction1::Vector{Float64}(def,3): direction vector v of a line (f(r) = p + x v)
- support_point_line2::Vector{Float64}(def,3): support vector p of a line (f(r) = p + x v)
- direction2::Vector{Float64}(def,3): direction vector v of a line (f(r) = p + x v)

# Returns
- intersection_point::Vector{Float64}(def,3): intersection point between a line and a line 
"""
function lineline(support_point_line1::Vector{}, direction1::Vector{},support_point_line2::Vector{}, direction2::Vector{})
    

    A = hcat(direction1,direction2*-1)
    b = support_point_line2 .- support_point_line1
  

    if (direction1 / norm(direction1)) ==  (direction2 / norm(direction2))
        error("Both directional vectors have the same direction.")
        return nothing 
    end

    t = A[1:2,:] \ b[1:2]
    print(t)
    mA = reshape(A[3,:],1,2)
    mt = reshape(t,2,1)

    if  mA * mt != b[3]
        error("The given arugments are skew lines")
    end

    intersection_point = support_point_line1 .+ t[1] .* direction1


    return intersection_point
end

function linesphere(support_point_line::Vector{}, direction::Vector{},sphere_center, sphere_radius)
    a = dot(direction, direction)
    b = 2 * dot(direction, support_point_line - sphere_center)
    c = dot(support_point_line - sphere_center, support_point_line - sphere_center) - sphere_radius^2

    discriminant = b^2 - 4 * a * c

    if discriminant < 0
        # Kein Schnittpunkt
        return nothing
    elseif discriminant == 0
        # Eine Lösung (tangentialer Schnittpunkt)
        t = -b / (2 * a)
        intersection_point = support_point_line + t *  direction
        return intersection_point
    else
        # Zwei Lösungen (Schnittpunkte)
        t1 = (-b + sqrt(discriminant)) / (2 * a)
        t2 = (-b - sqrt(discriminant)) / (2 * a)
        intersection_point1 = support_point_line + t1 *  direction
        intersection_point2 = support_point_line + t2 *  direction
        return intersection_point1, intersection_point2
    end
end

#ToDO
function planeplane()
    
end

#ToDO
function spheresphere()
    
end

#ToDO
function triangletriangle()
    
end

#ToDO
function raytriangle()

end

#ToDO
function raycylinder()
    
end

#ToDO
function polyhedron()

end


"""
    circcirc(pos_circ, r_circ, n_circ, pos_circ_2, r_circ_2)

calculates the intersecting points of two circles in one plane in three dimensional space  

# Arguments
- pos_circ: position of cirlce 1
- r_circ: radius of circle 1
- pos_circ_2: position of circle 2
- r_circ_2: radius of circle 2
- n_circ: normal vector of both circles

# Returns
- `p1`: intersecting point
- `p2`: intersecting point
"""
function circcirc(pos_circ, r_circ, n_circ, pos_circ_2, r_circ_2)
    n_circ = n_circ/norm(n_circ)        #n_circ must be a unit vector
    d = norm(pos_circ -pos_circ_2)                 
    
    if d > (abs(r_circ) + abs(r_circ_2)) || ((abs(d) + abs(r_circ)) <  abs(r_circ_2)) || ((abs(d) + abs(r_circ_2)) <  abs(r_circ))   # Check if circles do not intersect      
        error("circles do not intersect")
    elseif d == (abs(r_circ) + abs(r_circ_2)) ||   (abs(d) + abs(r_circ)) == abs(r_circ_2) # Check if circles are tangent at one point     
        p1 = pos_circ + (pos_circ -pos_circ_2)/norm(pos_circ -pos_circ_2) * r_circ;
        p2 = [];
    else                                        
        lambda = acos((norm(pos_circ -pos_circ_2)^2 + r_circ^2-r_circ_2^2)/(2*r_circ*(norm(pos_circ -pos_circ_2))));
        h = sin(lambda)*r_circ;  
        a = sqrt(r_circ^2-h^2);
        ps = pos_circ - ((pos_circ-pos_circ_2)/norm(pos_circ-pos_circ_2))*a;
        v = cross(n_circ,(pos_circ-pos_circ_2)/norm(pos_circ-pos_circ_2));
        p1 = ps - h*(v/norm(v));
        p2 = ps + h*(v/norm(v));
        return p1,p2
    end
end

"""
    circsphere(pos_circ,r_circ,n_circ,pos_sphere,r_sphere)

calculates the intersecting points of a sphere (surface) and a circle

# Arguments
-`pos_circ`: position of the circle
-`r_circ`: radius of the circle
-`n_circ`: normal vector of the circle
-`pos_sphere`: position of the sphere
-`r_sphere`: radius of the sphere

# Returns
-`p1`: intersecting point
-`p2`: intersecting point

"""
function circsphere(pos_circ,r_circ,n_circ,pos_sphere,r_sphere)
    n_circ = n_circ/norm(n_circ)        #n_circ must be a unit vector
    d = (n_circ[1]*pos_sphere[1] + n_circ[2]*pos_sphere[2] + n_circ[3]*pos_sphere[3] - sum(n_circ.*pos_circ))
    if abs(d) > r_sphere
        error("No Intersection");
    elseif abs(d) == r_sphere
        I = pos_circ + r_sphere*n_circ;
    else
        r_circ_2 = sqrt(r_sphere^2-d^2);
        pos_circ_2 = pos_sphere -d*n_circ;
        p1, p2 = circcirc(pos_circ, r_circ, n_circ, pos_circ_2, r_circ_2);
    end
    return p1,p2
end





