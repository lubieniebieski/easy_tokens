require 'test_helper'

class NavigationTest < ActionDispatch::IntegrationTest
  test "index render correct template and layout" do
    get '/easy_tokens'
    assert_template :index
    assert_template layout: "layouts/easy_tokens/application"
  end

  test "edit render correct template and layout" do
    token = easy_tokens_tokens(:one)
    get "/easy_tokens/tokens/#{token.id}/edit"
    assert_template :edit
    assert_template layout: "layouts/easy_tokens/application", partial: "_form"
  end

  test "new render correct template and layout" do
    get "/easy_tokens/tokens/new"
    assert_template :new
    assert_template layout: "layouts/easy_tokens/application", partial: "_form"
  end
end
