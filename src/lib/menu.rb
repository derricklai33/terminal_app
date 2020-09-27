require_relative 'app_constants'

# Menu Class
class Menu
  include AppConstants

  # Initialized instance variable as an instance of CallApi class
  def initialize
    @restaurant_api = CallApi.new
  end

  # TTY prompt for user to select input
  def display_menu
    PROMPT.select('Welcome!') do |menu|
      menu.choice({ name: 'View all restaurants', value: '1' })
      menu.choice({ name: 'Input new restaurants', value: '2' })
      menu.choice({ name: 'Exit', value: '3' })
    end
  end

  def router
    loop do
      case display_menu
      when '1'
        @restaurant_api.restaurants.each do |value|
          puts value.name
          puts value.price
          puts value.type_of_cuisine
          puts value.location
        end
      when '2'
        puts 'Hi'
      when '3'
        exit
      end
    end
  end
end
