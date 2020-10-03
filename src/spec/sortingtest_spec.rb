require 'rspec'
require 'tty-prompt'
require 'httparty'
require_relative '../lib/sorting'
require_relative '../lib/restaurantapi'
require_relative '../lib/app_constants'
require_relative '../lib/restaurant'

RSpec.describe 'Sorting method' do
  include AppConstants

  it 'Ensuring counter reset works' do
    # Arrange
    sorting_test = SortingRestaurant.new
    example_array = [[5, 'test_name'], [2, 'test_name_2'], [17, 'test_name_3'], [4, 'test_name_4']]
    # Act
    sort_price = sorting_test.reset_counter(example_array)
    # Assert
    expect(sort_price[0]).to eq([1, 'test_name'])
    expect(sort_price[1]).to eq([2, 'test_name_2'])
    expect(sort_price[2]).to eq([3, 'test_name_3'])
    expect(sort_price[3]).to eq([4, 'test_name_4'])
  end
end
