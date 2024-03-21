using Documenter
using Intersect3D

makedocs(
    sitename = "Intersect3D",
    format = Documenter.HTML(),
    modules = [Intersect3D]
)

# Documenter can also automatically deploy documentation to gh-pages.
# See "Hosting Documentation" and deploydocs() in the Documenter manual
# for more information.
#=deploydocs(
    repo = "<repository url>"
)=#
