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
      menu.choice({ name: 'Pick a random restaurant!', value: '2' })
      menu.choice({ name: 'Exit', value: '3' })
    end
  end

  # Terminal table display method
  def terminal_table
    rows = @restaurant_api.restaurants.map(&:to_a)

    table = Terminal::Table.new({ headings: HEADINGS, rows: rows })
    puts table
  end

  def random_restaurant
    puts 'Your random choice of restaurant today is: '
  end

  def router
    loop do
      case display_menu
      when '1'
        terminal_table
      when '2'
        random_restaurant
      when '3'
        exit
      end
    end
  end
end
