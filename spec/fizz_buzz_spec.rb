# Unit test example for fizz_buzz.rb

require_relative '../fizz_buzz'

describe FizzBuzz do
  describe 'const COUNT_TO' do
    it { expect(FizzBuzz::COUNT_TO).to be_instance_of Fixnum }
  end

  describe 'const FIZZ' do
    it { expect(FizzBuzz::FIZZ).to be_instance_of String }
  end

  describe 'const BUZZ' do
    it { expect(FizzBuzz::BUZZ).to be_instance_of String }
  end

  describe 'const FIZZBUZZ' do
    it { expect(FizzBuzz::FIZZBUZZ).to be_instance_of String }
  end
  
  # We can use FizzBuzz constants, because we've tested them already in isolation.
  # One reason this is good, imagine "Fizz" was changed to "Fuzz" because marketing
  # thought that would sell better. Now you change the constant in FizzBuzz, and all
  # your tests update and pass automatically!
  describe '#fizz_buzz' do
    context 'when n is divisible by 3, not 5' do
      it { expect(FizzBuzz.fizz_buzz_or_fizzbuzz(3)).to eq FizzBuzz::FIZZ }
    end
    context 'when n is divisible by 5, not 3' do
      it { expect(FizzBuzz.fizz_buzz_or_fizzbuzz(5)).to eq FizzBuzz::BUZZ }
    end
    context 'when n is divisible by 5 and 3' do
      it { expect(FizzBuzz.fizz_buzz_or_fizzbuzz(15)).to eq FizzBuzz::FIZZBUZZ }
    end
    context 'when n is not divisible by 3 or 5' do
      it { expect(FizzBuzz.fizz_buzz_or_fizzbuzz(1)).to eq '1' }
    end
  end
  
  describe '#play' do
    it { expect(FizzBuzz.play).to be_instance_of String }
    it { expect(FizzBuzz.play).to include FizzBuzz::FIZZ }
    it { expect(FizzBuzz.play).to include FizzBuzz::BUZZ }
    it { expect(FizzBuzz.play).to include FizzBuzz::FIZZBUZZ }
    it { expect(FizzBuzz.play).to include '1' }
  end
end
