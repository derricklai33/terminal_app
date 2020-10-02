# Gem files
require 'tty-prompt'
require 'colorize'
require 'terminal-table'
require 'httparty'

# Files
require 'json'
require_relative 'app_constants'
require_relative 'menu'
require_relative 'restaurant'
require_relative 'restaurantapi'
require_relative 'sorting'

puts " "
puts "░█████╗░██████╗░███████╗  ██╗░░░██╗░█████╗░██╗░░░██╗  ██╗░░██╗██╗░░░██╗███╗░░██╗░██████╗░██████╗░██╗░░░██╗░█████╗░".colorize(:red)
puts "██╔══██╗██╔══██╗██╔════╝  ╚██╗░██╔╝██╔══██╗██║░░░██║  ██║░░██║██║░░░██║████╗░██║██╔════╝░██╔══██╗╚██╗░██╔╝██╔══██╗".colorize(:red)
puts "███████║██████╔╝█████╗░░  ░╚████╔╝░██║░░██║██║░░░██║  ███████║██║░░░██║██╔██╗██║██║░░██╗░██████╔╝░╚████╔╝░╚═╝███╔╝".colorize(:red)
puts "██╔══██║██╔══██╗██╔══╝░░  ░░╚██╔╝░░██║░░██║██║░░░██║  ██╔══██║██║░░░██║██║╚████║██║░░╚██╗██╔══██╗░░╚██╔╝░░░░░╚══╝░".colorize(:red)
puts "██║░░██║██║░░██║███████╗  ░░░██║░░░╚█████╔╝╚██████╔╝  ██║░░██║╚██████╔╝██║░╚███║╚██████╔╝██║░░██║░░░██║░░░░░░██╗░░".colorize(:red)
puts "╚═╝░░╚═╝╚═╝░░╚═╝╚══════╝  ░░░╚═╝░░░░╚════╝░░╚═════╝░  ╚═╝░░╚═╝░╚═════╝░╚═╝░░╚══╝░╚═════╝░╚═╝░░╚═╝░░░╚═╝░░░░░░╚═╝░░".colorize(:red)


# To start the application
start = Menu.new
start.router
