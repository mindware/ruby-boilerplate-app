require 'yaml'

# Class loads all YAML data and keeps it in memory
class Loader
  attr_reader :target, :data, :last_update

  def initialize(target, extension)
    @target = "./#{target}/**/*.#{extension}"
    @last_update = Time.now
    @data = {}
    puts "Loading: #{@target}"
    load_data
  end

  def load_data
    Dir[@target].each do |file|
      data = YAML::load_file(file)
      #data.each do |key, value|
      #  puts "#{key} -> #{value}"
      #end
      @data.merge!(data)
    end
    return @data
  end
end
