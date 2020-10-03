# Gem files
require 'tty-prompt'
require 'colorize'
require 'terminal-table'
require 'httparty'

# Files
require 'optparse'
require 'json'
require_relative 'app_constants'
require_relative 'menu'
require_relative 'restaurant'
require_relative 'restaurantapi'
require_relative 'sorting'

# Option parser
parser = OptionParser.new do |option|
  include AppConstants

  option.banner = 'Welcome to What are we having tonight? app!'
  option.on('-v', '--version', 'Displays the version') do
    puts "You are on Version #{VERSION}"
    exit
  end

  option.on('-h', '--help', 'Display Help menu') do
    puts option
    exit
  end

  option.on('-r', '--random', 'Display a random restaurant') do
    system('clear')
    puts 'Generating a random restaurant.......'.colorize(:green)
    opt = Menu.new
    dis = opt.random_restaurant
    exit
  end
end

parser.parse!

system('clear')
puts ' '
puts '░█████╗░██████╗░███████╗  ██╗░░░██╗░█████╗░██╗░░░██╗  ██╗░░██╗██╗░░░██╗███╗░░██╗░██████╗░██████╗░██╗░░░██╗░█████╗░'.colorize(:red)
puts '██╔══██╗██╔══██╗██╔════╝  ╚██╗░██╔╝██╔══██╗██║░░░██║  ██║░░██║██║░░░██║████╗░██║██╔════╝░██╔══██╗╚██╗░██╔╝██╔══██╗'.colorize(:red)
puts '███████║██████╔╝█████╗░░  ░╚████╔╝░██║░░██║██║░░░██║  ███████║██║░░░██║██╔██╗██║██║░░██╗░██████╔╝░╚████╔╝░╚═╝███╔╝'.colorize(:red)
puts '██╔══██║██╔══██╗██╔══╝░░  ░░╚██╔╝░░██║░░██║██║░░░██║  ██╔══██║██║░░░██║██║╚████║██║░░╚██╗██╔══██╗░░╚██╔╝░░░░░╚══╝░'.colorize(:red)
puts '██║░░██║██║░░██║███████╗  ░░░██║░░░╚█████╔╝╚██████╔╝  ██║░░██║╚██████╔╝██║░╚███║╚██████╔╝██║░░██║░░░██║░░░░░░██╗░░'.colorize(:red)
puts '╚═╝░░╚═╝╚═╝░░╚═╝╚══════╝  ░░░╚═╝░░░░╚════╝░░╚═════╝░  ╚═╝░░╚═╝░╚═════╝░╚═╝░░╚══╝░╚═════╝░╚═╝░░╚═╝░░░╚═╝░░░░░░╚═╝░░'.colorize(:red)

# To start the application
start = Menu.new
start.router
