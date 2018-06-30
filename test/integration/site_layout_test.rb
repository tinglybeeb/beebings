require 'test_helper'

class SiteLayoutTest < ActionDispatch::IntegrationTest
  # test "the truth" do
  #   assert true
  # end



  # Get the root path (Home page).
  # Verify that the right page template is rendered.
  # Check for the correct links to the Home, Help, About, and Contact pages. 
  test 'should get correct homepage layout links' do
  	get root_path
  	assert_template "static_pages/home"
  	# test for presence of each link. Rails automatically inserts the value of about_path in place of the question mark. 
  	# these thus check for the presence of e.g. <a href="/about">...</a>
  	assert_select "a[href=?]", root_path
  	assert_select "a[href=?]", about_path
  	assert_select "a[href=?]", help_path
  	assert_select "a[href=?]", contact_path
    assert_select "a[href=?]", signup_path
	end

end
