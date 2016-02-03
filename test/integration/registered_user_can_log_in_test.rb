require 'test_helper'

class RegisteredUserCanLogInTest < ActionDispatch::IntegrationTest
  test "registered user can log in" do
    visit login_path
    fill_in "Email", with: "carl@example.com"
    fill_in "Password", with: "password"
    click_on "Log in"
    assert redirected_to users(:Carl)
    follow_redirect!
    assert_template 'users/show'
  end
end
