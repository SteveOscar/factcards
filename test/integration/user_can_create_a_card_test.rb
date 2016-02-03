require 'test_helper'

class UserCanCreateACardTest < ActionDispatch::IntegrationTest
  def setup
    @user = users(:Carl)
  end

  # test "a registered user can create a card" do
  #   log_in_as(@user)
  # end
end
