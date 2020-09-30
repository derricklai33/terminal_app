require 'rspec'
require 'tty-prompt'
require_relative '../lib/restaurant'

RSpec.describe 'Generating restaurant' do
  it 'To generate new restaurant class works' do 
    # Arrange
    test_new_restaurant = Restaurant.new(
      '1',
      'Test_restaurant',
      '200',
      'Asian',
      '2 Fruit Lane',
      '4.5'
    )
    # Act
    test_id = test_new_restaurant.id
    test_name = test_new_restaurant.name
    test_price = test_new_restaurant.price
    test_cuisine = test_new_restaurant.type_of_cuisine
    test_address = test_new_restaurant.address
    test_rating = test_new_restaurant.rating
    
    # Assert
    expect(test_id).to eq(1)
    expect(test_name).to eq('Test_restaurant')
    expect(test_price).to eq(200)
    expect(test_cuisine).to eq('Asian')
    expect(test_address).to eq('2 Fruit Lane')
    expect(test_rating).to eq(4.5)
  end
end