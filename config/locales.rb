path = Dir[File.expand_path("app/locales/en") + "/*.yml"]
puts "Loading locales from: #{path.join(", ")}"
I18n.load_path << path
I18n.default_locale = :en 
path = nil
