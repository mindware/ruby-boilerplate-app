require 'yaml'
require_relative 'helpers/presentation'
require_relative 'lib/systems/loader'

class Driver
  def initialize
    seed = ENV['world_seed']
    $loader = Loader.new('app/data/yaml', 'yml')
    $seed   = Generator::WorldSeed.new(seed)
  end
end
