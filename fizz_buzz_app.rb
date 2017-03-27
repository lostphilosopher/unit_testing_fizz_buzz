require_relative 'fizz_buzz'

class FizzBuzzApp
  attr_reader :request

  def initialize(request)
    @request = request
  end

  def status
    200
  end

  def headers
    {
      'Content-Type' => 'text/html',
      'Content-Length' => body.size.to_s
    }
  end

  def body
    content = FizzBuzz.play

    layout(content)
  end

  private

  def layout(content)
%{<!DOCTYPE html>
<html lang="en">
  <head>

    <meta charset="utf-8">
    <title>FizzBuzz App</title>
  </head>
  <body>
    #{content}
  </body>
</html>}
  end
end

# Ignore this, it's here because this is
# a bare bones Rack app.
class FizzBuzzApp::Rack
  def call(env)
    request = Rack::Request.new(env)
    my_app = FizzBuzzApp.new(request)

    [my_app.status, my_app.headers, [my_app.body]]
  end
end
