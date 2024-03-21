# calculates the intersecting points of a sphere (surface) and a circle
# pos_circ: position of the circle
# r_circ: radius of the circle
# n_circ: normal vector of the circle
# pos_sphere: position of the sphere
# r_sphere: radius of the sphere


#include("circcirc.jl")
#
#
#
#
#"""
#    circsphere(pos_circ,r_circ,n_circ,pos_sphere,r_sphere)
#
#calculates the intersecting points of a sphere (surface) and a circle
#
## Arguments
#-`pos_circ`: position of the circle
#-`r_circ`: radius of the circle
#-`n_circ`: normal vector of the circle
#-`pos_sphere`: position of the sphere
#-`r_sphere`: radius of the sphere
#
## Returns
#-`p1`: intersecting point
#-`p2`: intersecting point
#
#"""
#function circsphere(pos_circ,r_circ,n_circ,pos_sphere,r_sphere)
#    n_circ = n_circ/norm(n_circ)        #n_circ must be a unit vector
#    d = (n_circ[1]*pos_sphere[1] + n_circ[2]*pos_sphere[2] + n_circ[3]*pos_sphere[3] - sum(n_circ.*pos_circ))
#    if abs(d) > r_sphere
#        error("No Intersection");
#    elseif abs(d) == r_sphere
#        I = pos_circ + r_sphere*n_circ;
#    else
#        r_circ_2 = sqrt(r_sphere^2-d^2);
#        pos_circ_2 = pos_sphere -d*n_circ;
#        p1, p2 = circcirc(pos_circ, r_circ, n_circ, pos_circ_2, r_circ_2);
#    end
#    return p1,p2
#end
#
#
#
#"""
#    circsphereforopt(pos_circ,r_circ,n_circ,pos_sphere,r_sphere)
#    
#calculates the intersecting points of a sphere (surface) and a circle
#
#!only for optimization: seperate use of circcirc-function for intersects
#
## Arguments
#-`pos_circ`: position of the circle
#-`r_circ`: radius of the circle
#-`n_circ`: normal vector of the circle
#-`pos_sphere`: position of the sphere
#-`r_sphere`: radius of the sphere
#
## Returns
#-`p1`: intersecting point
#-`p2`: intersecting point
#
#"""
#function circsphereforopt(pos_circ, r_circ, n_circ, pos_sphere, r_sphere)
#
#    # Normalize the vector n_circ to ensure it is a unit vector
#    n_circ = n_circ / norm(n_circ)
#
#    # Calculate the signed distance between the sphere and the plane defined by n_circ
#    d = (n_circ[1]*pos_sphere[1] + n_circ[2]*pos_sphere[2] + n_circ[3]*pos_sphere[3] - sum(n_circ.*pos_circ))
#
#    # Check for intersection conditions
#    if (abs(d) > r_sphere) 
#        # If the signed distance is greater than the sphere radius, there is no intersection
#        error("No Intersection")
#    elseif abs(d) == r_sphere
#        # If the signed distance is equal to the sphere radius, there is one intersection point
#        I = pos_circ + r_sphere * n_circ
#    else
#        # If the signed distance is less than the sphere radius, there are two intersection points
#        r_circ_2 = sqrt(r_sphere^2 - d^2)
#
#        pos_circ_2 = pos_sphere - d * n_circ
#        #println( pos_circ_2)
#        # Calculate the coordinates of the intersection points using circcirc_p1 and circcirc_p2 functions
#        p1 = circcirc_p1(pos_circ, r_circ, n_circ, pos_circ_2, r_circ_2)
#        p2 = circcirc_p2(pos_circ, r_circ, n_circ, pos_circ_2, r_circ_2)
#    end
#
#    # Return the intersection points p1 and p2
#    return p1, p2
#end
#
#
#"""
#    circsphere_p1(pos_circ,r_circ,n_circ,pos_sphere,r_sphere)
#    
#    wrapperfunktion for optimization with only one intersectpoint as an output.
#
#"""
#circsphere_p1(pos_circ,r_circ,n_circ,pos_sphere,r_sphere) = circsphereforopt(pos_circ,r_circ,n_circ,pos_sphere,r_sphere)[1]
#
#
#"""
#    circsphere_p2(pos_circ,r_circ,n_circ,pos_sphere,r_sphere)
#    
#    wrapperfunktion for optimization with only one intersectpoint as an output.
#
#"""
#circsphere_p2(pos_circ,r_circ,n_circ,pos_sphere,r_sphere) = circsphereforopt(pos_circ,r_circ,n_circ,pos_sphere,r_sphere)[2]
#
#
#
#