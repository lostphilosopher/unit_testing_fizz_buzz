# Example tests for fizz_buzz_app.rb both
# solitary and sociable.

require_relative '../fizz_buzz_app'

describe FizzBuzzApp do
  let(:fizz_buzz_app) { FizzBuzzApp.new('') }

  describe 'status' do
    it { expect(fizz_buzz_app.status).to eq 200 }
  end

  # Sociable Service Layer Test
  # Note the fizz_buzz_app.headers calls fizz_buzz_app.body
  # which calls FizzBuzz.play, a method from a class outside of
  # test.
  describe 'headers' do
    describe 'Content-Type' do
      it { expect(fizz_buzz_app.headers['Content-Type']).to eq 'text/html' }
    end
    describe 'Content-Length' do
      it { expect(fizz_buzz_app.headers['Content-Length']).to be_instance_of String }
      it { expect(fizz_buzz_app.headers['Content-Length']).to eq '456' } # We're only doing this to prove FizzBuzz is a different object below.
    end
  end

  # Solitary Service Layer Test
  # Note the fizz_buzz_app.headers calls fizz_buzz_app.body
  # which calls FizzBuzz.play, a method from a class outside of
  # test. To maintain solitude we are creating a Test Double for FizzBuzz
  # object to handle the request.
  describe 'headers' do
    # Now, when fizz_buzz_app.body calls FizzBuzz.play, we'll return
    # fake_content instead of actually evaluating the real method.
    before do
      fake_content = '12Fizz4Buzz'
      expect(FizzBuzz).to receive(:play).and_return(fake_content)
    end
    describe 'Content-Type' do
      it { expect(fizz_buzz_app.headers['Content-Type']).to eq 'text/html' }
    end
    describe 'Content-Length' do
      it { expect(fizz_buzz_app.headers['Content-Length']).to be_instance_of String }
      it { expect(fizz_buzz_app.headers['Content-Length']).to eq '154' } # We're only doing this to prove FizzBuzz is a different object above.
    end
  end
end
