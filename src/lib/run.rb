# gem files
require 'tty-prompt'
require 'colorize'
require 'terminal-table'

#files
require_relative 'menu'
require_relative 'restaurant'
require_relative 'app_constants'

start = Menu.new
start.router