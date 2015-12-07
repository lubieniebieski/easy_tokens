require 'test_helper'

class NavigationTest < ActionDispatch::IntegrationTest
  fixtures :all
  # 
  # test "index render correct template and layout" do
  #   get :index
  #   assert_template :index
  #   assert_template layout: "layouts/easy_tokens/application"
  # end
  #
  # test "edit render correct template and layout" do
  #   get :edit
  #   assert_template :edit
  #   assert_template layout: "layouts/easy_tokens/application", partial: "_form"
  # end
  #
  # test "new render correct template and layout" do
  #   get '/tokens/new'
  #   assert_template :new
  #   assert_template layout: "layouts/easy_tokens/application", partial: "_form"
  # end
end
