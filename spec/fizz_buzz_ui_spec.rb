require 'rack'
require 'capybara/rspec'
require_relative '../fizz_buzz_app'
Capybara.app = FizzBuzzApp::Rack.new

describe 'home page', type: :feature do
  it 'prints the fizz buzz string' do
    visit '/'
    expect(page).to have_content('12Fizz4Buzz')
  end
end

