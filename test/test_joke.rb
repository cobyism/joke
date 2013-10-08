require 'joke'
require 'test/unit'
require 'rack/test'

class JokeTest < Test::Unit::TestCase
  include Rack::Test::Methods

  def app
    Joke::App
  end

  def test_index
    get '/'
    assert last_response.ok?
    assert last_response.body.include?("Joke")
  end
end
