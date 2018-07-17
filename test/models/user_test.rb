require 'test_helper'

class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  def setup
  	@user = User.new(name: "test name", email: "testemail@gmail.com", password: "foobar", password_confirmation: "foobar")
  end

  test "should be valid" do
  	# assert succeeds if @user.valid? returns true
  	assert @user.valid?
  end

  test "name should be present" do
  	@user.name = ""
  	assert_not @user.valid?
  end

  test "email should be present" do
  	@user.email = ""
  	assert_not @user.valid?
  end

  test "name should not be too long" do
  	@user.name = "a"*51
  	assert_not @user.valid?
  end

  test "email should not be too long" do
  	@user.email = "a"*256
  	assert_not @user.valid?
  end

  test "email validation should accept valid emails" do
  	valid_emails = %w[test@test.co user_name@testus.com john@foo.bar.org first.last@foo.bar.sg beeb+beeb@beeb.beeb]
  	valid_emails.each do |valid_email|
  		@user.email = valid_email
  		assert @user.valid?, "#{valid_email.inspect} should be valid"
  	end
  end

  test "email validation should reject invalid emails" do
  	invalid_emails = %w[user@example,com user_at_foo.org user.name@example.foo@bar_baz.com foo@bar+baz.com]
  	invalid_emails.each do |invalid_email|
  		@user.email = invalid_email
  		assert_not @user.valid?, "#{invalid_email.inspect} should be invalid"
  	end
  end

  test "email addresses should be unique" do
  	@user.save
  	duplicate_user = User.new(name: "test name", email: "testemail@gmail.com")
  	duplicate_user.email.upcase
  	assert_not duplicate_user.save
  end

  test "email addresses should be saved as lower case" do
  	mixed_case_email = "fOoBaR@Foo.BaR"
  	@user.email = mixed_case_email
  	@user.save
  	assert_equal @user.email.downcase, @user.reload.email
  end

  test "password should be present" do
  	@user.password = @user.password_confirmation = " "*6
  	assert_not @user.valid?
  end

  test "password should have a minimum length" do
  	@user.password = @user.password_confirmation = "a"*5
  end

end
