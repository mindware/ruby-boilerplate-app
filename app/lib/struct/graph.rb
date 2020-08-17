require 'rgl/adjacency'

require 'rgl/dot' # for drawing

class Graph < RGL::DirectedAdjacencyGraph
  def failed_test
    connector = Struct.new(:distance, :danger)
    seed = Random.new
    graph = Graph.new
    graph.add_vertices "Los Angeles", "New York", "Chicago", "Houston", "Seattle"
    #    edge_weights =
    #    {
    #      ["New York", "Los Angeles"] => 2445,
    #      ["Los Angeles", "Chicago"] => 2015,
    #      ["Los Angeles", "Houston"] => 1547,
    #      ["Chicago", "Houston"] => 939,
    #      ["Seattle", "Los Angeles"] => 1548
    #    }
    edge_weights =
      {
        ["New York", "Los Angeles"] => connector.new(seed.rand, seed.rand),
        ["Los Angeles", "Chicago"] => connector.new(seed.rand(2015), seed.rand),
        ["Los Angeles", "Houston"] => connector.new(seed.rand(1547), seed.rand),
        ["Chicago", "Houston"] => connector.new(seed.rand(939), seed.rand),
        ["Seattle", "Los Angeles"] => connector.new(seed.rand(1548), seed.rand)
    }

    edge_weights.each { |(city1, city2), w| graph.add_edge(city1, city2) }

    output = graph.print_dotted_on

    #puts graph.methods
    puts graph.vertices.each do |x|
      puts x.edges
    end
    #puts "https://dreampuf.github.io/GraphvizOnline/#digraph G {#{output}}"

  end
end
