require 'test_helper'

module EasyTokens
  class TokenTest < ActiveSupport::TestCase
    test 'assigns value after initialization' do
      token = Token.new
      assert_not token.value.nil?
    end
    # test "the truth" do
    #   assert true
    # end
  end
end
