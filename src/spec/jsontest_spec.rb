require 'rspec'
require 'tty-prompt'
require 'httparty'
require_relative '../lib/restaurantapi'
require_relative '../lib/app_constants'
require_relative '../lib/menu'

RSpec.describe 'Json file' do
  include AppConstants

  # Arrange
  let (:json_test) {CallApi.new}

  it 'Ensuring json file reads correctly' do
    # Act
    test_name = json_test.read_saved_restaurants[0].name
    test_name_2 = json_test.read_saved_restaurants[1].name

    # Assert
    expect(test_name).to eq("Hanaichi")
    expect(test_name_2).to eq("Hungry Jacks")
  end

  it 'Ensuring output will be json file + api call' do
    # Act
    test_output_name = json_test.output_restaurant[json_test.read_saved_restaurants.length].name
    test_output_name_2 = json_test.output_restaurant[0].name
    test_output_price = json_test.output_restaurant[json_test.read_saved_restaurants.length].price
    test_output_price_2 = json_test.output_restaurant[0].price
    # Assert
    expect(test_output_name).to eq("Conservatory")
    expect(test_output_name_2).to eq("Hanaichi")
    expect(test_output_price).to eq(230)
    expect(test_output_price_2).to eq(24)
  end
end