require 'test_helper'

class StaticPagesControllerTest < ActionDispatch::IntegrationTest
  
	# This function is run before every test
	def setup
		@base_title = "| Beebings"
	end

	# Test that the following pages exist (Test for successful HTTP GET responses)
	# Test that the pages show the correct titles

  test "should get home" do
    get root_url
    assert_response :success
    assert_select "title", "Home #{@base_title}"
  end

  test "should get help" do
    get static_pages_help_url
    assert_response :success
    assert_select "title", "Halp #{@base_title}"
  end

  test "should get about" do
  	get static_pages_about_url
  	assert_response :success
  	assert_select "title", "About #{@base_title}"
  end

  test "should get contact" do
  	get static_pages_contact_url
  	assert_response :success
  	assert_select "title", "Contact Beebs #{@base_title}"
  end


end
