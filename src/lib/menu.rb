# require_relative 'app_constants'
require_relative 'restaurantapi'
require 'byebug'

# Menu Class
class Menu
  attr_accessor :choice

  include AppConstants

  # Initialized instance variable as an instance of CallApi class
  def initialize
    @restaurant_api = CallApi.new
    @choice = choice
  end

  # TTY prompt for user to menu select input
  def display_menu
    PROMPT.select('Welcome to my What are we having tonight? app!'.colorize(:green)) do |menu|
      menu.choice({ name: 'View all restaurants', value: '1' })
      menu.choice({ name: 'Pick a random restaurant!', value: '2' })
      menu.choice({ name: 'Input new restaurants', value: '3' })
      menu.choice({ name: 'Exit', value: '4' })
    end
  end

  # TTY prompt for user to sort according to price, rating and cuisine type
  def sorting_choice
    @choice = PROMPT.select('Do you wish to sort?'.colorize(:green)) do |menu|
      menu.choice({ name: 'Sort according to price', value: '1' })
      menu.choice({ name: 'Sort according to rating', value: '2' })
      menu.choice({ name: 'Sort according to type of cuisine', value: '3' })
      menu.choice({ name: 'Back to main menu', value: '4' })
    end
  end

  # Terminal table display method (Sorted Menu)
  def terminal_table_sorted(arr)
    rows = arr
    table = Terminal::Table.new({ headings: HEADINGS, rows: rows })
    puts table
  end

  # Terminal table display method (Menu)
  def terminal_table_menu
    system('clear')
    rows = @restaurant_api.output_restaurant.map(&:to_a)
    table = Terminal::Table.new({ headings: HEADINGS, rows: rows })
    puts table
  end

  # Generate random restaurant prompt
  def random_restaurant
    rand_res = @restaurant_api.generate_random
    puts 'Your random choice of restaurant today is: '.colorize(:green) + (rand_res[1]).to_s
    puts 'Details:'.colorize(:green)
    i = 2
    while i < rand_res.length
      puts "#{HEADINGS[i]}: ".colorize(:green) + (rand_res[i]).to_s
      i += 1
    end
  end

  # Menu loop
  def router
    loop do
      case display_menu
      when '1'
        terminal_table_menu
        sorting_menu
      when '2'
        random_restaurant
      # Generate input and saves it to JSON file to 'append' to JSON file
      when '3'
        @restaurant_api.generate_restaurants
        @restaurant_api.save_restaurants
      when '4'
        exit
      end
    end
  end
end

# Loop for sorting menu
def sorting_menu
  sort = SortingRestaurant.new
  loop do
    case sorting_choice
    when '1'
      @choice = sort.sorting_price
    when '2'
      @choice = sort.sorting_rating
    when '3'
      @choice = sort.sorting_cuisine
    when '4'
      router
    end
    terminal_table_sorted(@choice)
  end
end
