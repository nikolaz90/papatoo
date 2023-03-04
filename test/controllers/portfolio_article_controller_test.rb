require "test_helper"

class PortfolioArticleControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get portfolio_article_index_url
    assert_response :success
  end

  test "should get new" do
    get portfolio_article_new_url
    assert_response :success
  end
end
