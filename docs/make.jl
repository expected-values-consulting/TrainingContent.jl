using TrainingContent
using Documenter

DocMeta.setdocmeta!(TrainingContent, :DocTestSetup, :(using TrainingContent); recursive=true)

makedocs(;
    modules=[TrainingContent],
    authors="Jonathan Miller jonathan.miller@fieldofnodes.com",
    sitename="TrainingContent.jl",
    format=Documenter.HTML(;
        canonical="https://fieldofnodes.github.io/TrainingContent.jl",
        edit_link="main",
        assets=String[],
    ),
    pages=[
        "Home" => "index.md",
    ],
)

deploydocs(;
    repo="github.com/fieldofnodes/TrainingContent.jl",
    devbranch="main",
)
