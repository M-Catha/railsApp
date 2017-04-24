require 'test_helper'

class SiteLayoutTest < ActionDispatch::IntegrationTest
  include ApplicationHelper
  
  def setup
    @user = users(:matt)
  end
  
  test "layout links" do
    get root_path
    assert_template 'static_pages/home'
    assert_select "a[href=?]", root_path, count:2
    assert_select "a[href=?]", help_path
    assert_select "a[href=?]", users_path, count: 0
    assert_select "a[href=?]", about_path
    assert_select "a[href=?]", contact_path
    get signup_path
    assert_select "title", full_title("Sign Up")
    log_in_as(@user)
    follow_redirect!
    assert_select "a[href=?]", users_path
  end


end
