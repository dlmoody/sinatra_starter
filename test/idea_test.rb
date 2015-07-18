require File.expand_path '../test_helper.rb', __FILE__

class IdeaTest < MiniTest::Unit::TestCase

  include Rack::Test::Methods

  def app
    IdeaBoxApp
  end

  def test_web_app_responds
    get '/'
    assert last_response.ok?

  end
end
