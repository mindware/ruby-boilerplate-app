require 'yaml'

module Generator
  class Races
    attr_reader :list

    def initialize()
      @list = [] 
      total = 32 #random_races() 
      mutate(total)

      puts "Selected races are: \n - #{@list.sort.join("\n - ")}"
    end

    def data
      $loader.data['races']
    end

    # Combine randomly decides if this is a pure-bred 
    # race or a hybrid based on one of the main races. 
    def combine(race)
      # get total number of main races
      main_total = data['main'].length
      # leave to chance if this will be a hybrid creature
      # or a creature-folk (pure). 
      is_hybrid = $seed.random(2) == 1 ? true : false
      if(is_hybrid)
        random = $seed.random(main_total) 
        name  = data['main'].keys[random]
        based_race  = data['main'][name]
        presentation_chance = $seed.random(data['combinations'].length)
        presentation = data['combinations'][presentation_chance]
        presentation = presentation % { :race => race, :form => based_race['form'] }
        #return "#{based_race['form']} #{race}"
        return "#{presentation}"
      else
        return "#{race}-folk"
      end
    end

    def mutate(rounds)
      main_total  = data['main'].length - 1
      mutations_total = data['mutations'].length - 1
      total = main_total + mutations_total
      # Total needs total number as generating a
      # random number automatically starts at 0, but
      # for the purposes of our calculations below
      # we now need main_total to be length - 1 for proper
      # indexing.
      puts "Total races: #{total} (without combining)"

      if(rounds > total)
        raise StandardError, "Trying more mutation rounds than the total number of races "+
                             "that exist. Add combinatorial (dwarvish orc) or update your code."
      end

      (0..rounds).each do |i|
        print "#{i}.) "
        random_race = $seed.random(total)
        # To get the proper index when dealing with mutations array
        # we remove the main races.
        if(random_race > (main_total))
          random_race = random_race - main_total
        end
        if(random_race <= main_total) 
          race = data['main'].keys[random_race]
          puts "Main Selected: #{race} (#{random_race})"
          if(list.include? race) 
            puts "DUPLICATE. Trying agin."
            redo
          else
            list << race
          end
        else
          #combine_races = $seed.random(1) == 1 ? true : false 
          race = data['mutations'][random_race]
          #if(combine_races) 
            race = combine(race) 
          #end
          puts "Mutation Selected: #{race} (#{random_race})"
          if(list.include? race) 
            puts "DUPLICATE. Trying agin."
            redo
          else
            list << race
          end
        end
      end
    end
  end
end
