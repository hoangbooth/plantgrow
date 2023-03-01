# Load the Rails application.
require_relative 'application'

# Initialize the Rails application.
Rails.application.initialize!

# Image Upload Gem
# In the file config/environment.rb, add this line to the end:
# After running install gem in the gem file
require "carrierwave"
require "carrierwave/orm/activerecord"
