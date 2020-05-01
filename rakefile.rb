require_relative 'config/application.rb'
require_all 'tasks'

#task default: %w[start]
task :default do 
  puts "Which task would you like to do? (see ./tasks/)"
  system("rake -T -A")
end
