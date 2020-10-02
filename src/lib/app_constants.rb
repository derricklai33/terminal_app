# Constants used throughout application
module AppConstants
  PROMPT = TTY::Prompt.new
  HEADINGS = ['ID', 'Name', 'Price for 2', 'Type of cuisine', 'Address', 'Rating'].freeze
  INPUTS = %w[name price cuisine location rating].freeze
  VERSION = '1.0.0'
end
