require 'test_helper'

class UserCanRegisterTest < ActionDispatch::IntegrationTest
  test "new user can register" do
    visit cards_path
    click_on 'Sign Up'
    fill_in 'Username', with: "steve"
    fill_in 'Email', with: "steve@example.com"
    fill_in 'Password', with: "pw"
    fill_in 'Password confirmation', with: "pw"

    assert_equal 1, User.all.count

    click_on 'Create Account'
    
    assert_equal 2, User.all.count
    assert page.has_content?("steve")
  end

end
