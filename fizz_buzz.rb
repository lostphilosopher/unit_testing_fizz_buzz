class FizzBuzz
  COUNT_TO = 100
  FIZZ = 'Fizz'
  BUZZ = 'Buzz'
  FIZZBUZZ = 'Fizzbuzz'

  def self.play
    output = ''
    (1..COUNT_TO).each do |n|
      output = output + fizz_buzz_or_fizzbuzz(n)
    end

    return output
  end

  def self.fizz_buzz_or_fizzbuzz(n)
    output = n
    if ((n % 3 == 0) && (n % 5 == 0))
      output = FIZZBUZZ
    elsif (n % 3 == 0)
      output = FIZZ
    elsif (n % 5 == 0)
      output = BUZZ
    else
      output = output.to_s
    end

    return output
  end
end
