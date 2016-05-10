# bundle exec rake test:models
require 'test_helper'

class UserTest < ActiveSupport::TestCase

  def setup
    @user = User.new(first_name: "Dom", last_name: "Michalec", email: "dominicjjmichalec@gmail.com", password: "hello!", password_confirmation: "hello!")
  end

  test "should be valid" do
    assert @user.valid?
  end

  test "first_name should be present" do
    @user.first_name = "    "
    assert_not @user.valid?
  end

  test "last_name should be present" do
    @user.last_name = "     "
    assert_not @user.valid?
  end

  test "email should be present" do
    @user.email = "         "
    assert_not @user.valid?
  end

  test "first_name should not be longer than 50 characters" do
    @user.first_name = "a"*51
    assert_not @user.valid?
  end

  test "last_name should not be longer than 50 characters" do
    @user.last_name = "a"*51
    assert_not @user.valid?
  end

  test "email should not be longer than 50 characters" do
    @user.email = "a"*76
    assert_not @user.valid?
  end

  test "email should accept valid inputs" do
    valid_emails = %w(user@example.com user@example.jp USER@example.com first.user@example.com first_user@example.com)

    valid_emails.each do |valid_email|
      @user.email = valid_email
      assert @user.valid?, "#{valid_email.inspect} should be valid."
    end
  end

  test "email should reject invalid inputs" do
    invalid_emails = %w(foo@example_site.com foo_at_example.com foo,bar@example.com foo@example+site.com foo,@example. foo@example)

    invalid_emails.each do |invalid_email|
      @user.email = invalid_email
      assert_not @user.valid?, "#{invalid_email} should be invalid."
    end
  end

  test "users should have unique email addresses" do
    duplicate_user = @user.dup
    duplicate_user.email = @user.email.upcase
    @user.save
    assert_not duplicate_user.valid?
  end

  test "password should not be shorter than 6 characters" do
    @user.password = "a"*5
    assert_not @user.valid?
  end
end
