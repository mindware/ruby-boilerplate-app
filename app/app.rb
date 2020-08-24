require 'yaml'
require_relative 'helpers/presentation'
require_relative 'lib/systems/loader'

class Driver
  def initialize
    $loader = Loader.new('app/data/yaml', 'yml')
    # seed = ENV['world_seed']
    # $seed   = Generator::WorldSeed.new(seed)
  end
end
