class WorldSeed

  attr_reader :seed

  def initialize(seed=nil)
    if seed.nil?
      @seed = Random.new_seed     
    else
      @seed = seed
    end
    @random = Random.new(@seed) 
    puts "WorldSeed is: #{@seed}"
  end

  def random(...)
    @random.rand(...)
  end

end
