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

  def test_pages
    get '/pages'
    assert last_response.ok?
    assert last_response.body.include?("Pages")
  end

  def test_page
    get '/pages/index.html'
    assert last_response.ok?
    assert last_response.body.include? "Name: index.html"
  end

  def test_posts
    get '/posts'
    assert last_response.ok?
    assert last_response.body.include?("Posts")
  end

  def test_config
    get '/config'
    assert last_response.ok?
    assert last_response.body.include?("Configuration")
  end

end
