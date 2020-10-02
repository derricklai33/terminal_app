require 'rspec'
require 'tty-prompt'
require_relative '../lib/restaurant'

RSpec.describe 'Restaurant class test' do
  # Arrange
  let (:test_new_restaurant) {Restaurant.new(
    '1',
    'Test_restaurant',
    '200',
    'Asian',
    '2 Elizabeth Street',
    '4.5'
  )}
  it 'Check for id attribute' do
    # Act
    test_id = test_new_restaurant.id

    # Assert
    expect(test_id).to eq(1)
  end

  it 'Check for name attribute' do
  # Act
  test_name = test_new_restaurant.name

  # Assert
  expect(test_name).to eq('Test_restaurant')
  end

  it 'Check for price attribute' do
    # Act
    test_price = test_new_restaurant.price

    # Assert
    expect(test_price).to eq(200)
  end

  it 'Check for cuisine attribute' do
    # Act
    test_cuisine = test_new_restaurant.type_of_cuisine
    # Assert
    expect(test_cuisine).to eq('Asian')
  end

  it 'Check for address attribute' do
    # Act
    test_address = test_new_restaurant.address
    # Assert
    expect(test_address).to eq('2 Elizabeth Street')
  end

  it 'Check for rating attribute' do
    # Act
    test_rating = test_new_restaurant.rating

    # Assert
    expect(test_rating).to eq(4.5)
  end
end
