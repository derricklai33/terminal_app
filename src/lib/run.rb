# Gem files
require 'tty-prompt'
require 'colorize'
require 'terminal-table'
require 'httparty'

# Files
require 'json'
require_relative 'menu'
require_relative 'restaurant'
require_relative 'app_constants'
require_relative 'restaurantapi'

# To start the application
start = Menu.new
start.router
