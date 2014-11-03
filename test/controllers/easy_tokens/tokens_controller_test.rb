require 'test_helper'

module EasyTokens
  class TokensControllerTest < ActionController::TestCase
    setup do
      @token = tokens(:one)
    end

    test "should get index" do
      get :index
      assert_response :success
      assert_not_nil assigns(:tokens)
    end

    test "should get new" do
      get :new
      assert_response :success
    end

    test "should create token" do
      assert_difference('Token.count') do
        post :create, token: { deactivated_at: @token.deactivated_at, description: @token.description, owner_id: @token.owner_id, value: @token.value }
      end

      assert_redirected_to token_path(assigns(:token))
    end

    test "should show token" do
      get :show, id: @token
      assert_response :success
    end

    test "should get edit" do
      get :edit, id: @token
      assert_response :success
    end

    test "should update token" do
      patch :update, id: @token, token: { deactivated_at: @token.deactivated_at, description: @token.description, owner_id: @token.owner_id, value: @token.value }
      assert_redirected_to token_path(assigns(:token))
    end

    test "should destroy token" do
      assert_difference('Token.count', -1) do
        delete :destroy, id: @token
      end

      assert_redirected_to tokens_path
    end
  end
end
