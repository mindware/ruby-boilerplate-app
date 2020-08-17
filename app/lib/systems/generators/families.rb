require_relative '../../struct/tree'

module Generator
  class Families

    def initialize(*args)
      generations = args['generations']
      family_tree = Tree.new
      generate(family_tree, generations) 
      generations.each do |i|
        family_tree = Tree.new()
      end
    end

    def generate(family, generations)
      t = Tree.new(7)
      t.children << Tree.new(3)
      t.children << Tree.new(11)
      #
      #puts t.value              # 7
      #puts t.children[0].value  # 3
      #puts t.children[1].value  # 11
    end 
  end
end
