require_relative 'app_constants'

class Menu
  include AppConstants

  def initialize
    @restaurant = []
  end
  
  def display_menu
    PROMPT.select("Welcome!") do |menu|
      menu.choice({ name: 'View all restaurants', value: '1'})
      menu.choice({ name: 'Input new restaurants', value: '2'})
      menu.choice({ name: "Exit", value: '3'})
    end
  end

  def router
    loop do
      case display_menu
      when '1'
        puts "Hello"
      when '2'
        puts "Hi"
      when '3'
        puts "bye"
      end
    end
  end
end
