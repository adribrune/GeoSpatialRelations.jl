import Pkg; Pkg.develop(path=joinpath(@__DIR__,"../../GeoSpatialRelations.jl"))
using Documenter

makedocs(
    format = Documenter.HTML(
        collapselevel = 1,
        sidebar_sitename = false,
        edit_link = nothing,
        size_threshold = 512000,
     ),
     modules = [GeoSpatialRelations],
     checkdocs=:exports,
     linkcheck=true,
)

# Documenter can also automatically deploy documentation to gh-pages.
# See "Hosting Documentation" and deploydocs() in the Documenter manual
# for more information.
#=deploydocs(
    repo = "<repository url>"
)=#
