module Generator
  class WorldSeed

    attr_reader :seed

    def initialize(seed=nil)
      if seed.nil?
        @seed = Random.new_seed     
      else
        @seed = seed.to_i
      end
      @random = Random.new(@seed) 
      puts "WorldSeed is: #{@seed}"
    end

    def random(...)
      @random.rand(...)
    end
  end
end
