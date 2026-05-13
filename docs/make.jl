using Lodestar
using Documenter

DocMeta.setdocmeta!(Lodestar, :DocTestSetup, :(using Lodestar); recursive=true)

makedocs(;
    modules=[Lodestar, Lodestar.SpikeTrain],
    authors="Nippani Meghana <meghananippani@email.com>",
    sitename="Lodestar.jl",
    checkdocs = :none,
    format=Documenter.HTML(;
        canonical="https://Nippani-Meghana.github.io/Lodestar.jl",
        edit_link="master",
        assets=String[],
    ),
    pages=[
        "Home" => "index.md",
    ],
)

deploydocs(;
    repo="github.com/Nippani-Meghana/Lodestar.jl",
    devbranch="master",
)
