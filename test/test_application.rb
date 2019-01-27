require_relative "test_helper"

class TestApp < PlayTracks::Application
end

class PlayTracksAppTest < Test::Unit::TestCase
  include Rack::Test::Methods

  def app
    TestApp.new
  end

  def test_get_request
    get "/"

    assert last_response.ok?
    body = last_response.body
    assert body.include?("Hello")
  end

  def test_nonexistant_route_request
    get "/this/is/not/a/route"

    # will fail: make test pass with routing
    assert !last_response.ok?
  end
end


