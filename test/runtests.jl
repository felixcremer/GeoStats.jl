using GeoStats
using Random
using Plots; gr(size=(600,400))
using VisualRegressionTests
using Test, Pkg

# list of maintainers
maintainers = ["juliohm"]

# environment settings
istravis = "TRAVIS" ∈ keys(ENV)
ismaintainer = "USER" ∈ keys(ENV) && ENV["USER"] ∈ maintainers
datadir = joinpath(@__DIR__,"data")

# load data sets
data1D = readtable(joinpath(datadir,"data1D.tsv"), delim='\t', coordnames=[:x])
data2D = readtable(joinpath(datadir,"data2D.tsv"), delim='\t', coordnames=[:x,:y])

# list of tests
testfiles = [
  "solvers.jl",
  "comparisons.jl"
]

@testset "GeoStats.jl" begin
  for testfile in testfiles
    include(testfile)
  end
end
