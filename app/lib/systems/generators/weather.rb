require_relative 'base'
module Generator
  class Weather < Base
    def initialize
    end

    def random
      @temperature, @weather = generate_random_weather
      present
    end

    def present
      return t(:weather, temperature: t(".#{@temperature}.name"), 
               weather: t(".#{@temperature}.#{@weather}"))
    end

    def generate_random_weather
      random_temperature = $seed.random(data['temperatures'].keys.length - 1)
      temperature = data['temperatures'].keys[random_temperature]
      random_weather = $seed.random(data['temperatures'][temperature]['weather'].length - 1) 
      weather = data['temperatures'][temperature]['weather'][random_weather]
      [temperature, weather]
    end
  end
end 
