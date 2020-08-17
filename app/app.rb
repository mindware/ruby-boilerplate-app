require 'yaml'
require_relative 'helpers/presentation'
require_relative 'lib/systems/loader'

class Driver
  def initialize
    seed = nil
    #seed = 85568553169256512463213985151384129058
    $loader = Loader.new('app/data/yaml', 'yml')

    $seed   = WorldSeed.new(seed)
    $races  = Generator::Races.new

    $weather = Generator::Weather.new 
    puts $weather.random
  end
end
