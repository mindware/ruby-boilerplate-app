ENV['BUNDLE_GEMFILE'] ||= File.expand_path('../Gemfile', __dir__)

require 'bundler/setup' # Set up gems listed in the Gemfile.
Bundler.require

# If interested in using dotenv for local variables, uncomment these lines:
#require 'dotenv'
#Dotenv.load

# We can also set local variables using environment.rb:
require_relative 'environment' # setup additional local variables
require_relative 'locales' # setup additional internationalization

require 'require_all'
require_all 'app'
