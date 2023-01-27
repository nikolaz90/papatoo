require "test_helper"

class SpellThisControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get spell_this_index_url
    assert_response :success
  end
end
