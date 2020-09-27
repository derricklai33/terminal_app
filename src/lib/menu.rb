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

  def terminal_table
    rows = @restaurant_api.restaurants.map do |value|
      value.to_a
    end

    table = Terminal::Table.new({headings: HEADINGS, rows: rows} )
    puts table
  end
  def router
    loop do
      case display_menu
      when '1'
        terminal_table
      when '2'
        puts 'Hi'
      when '3'
        exit
      end
    end
  end
end
