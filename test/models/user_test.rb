require 'test_helper'

class UserTest < ActiveSupport::TestCase
  
  test "User must enter first name" do
  user = User.new
  assert !user.save
  assert !user.errors[:first_name].empty?
  
  end

  test "User must enter last name" do
  user = User.new
  assert !user.save
  assert !user.errors[:last_name].empty?
  
  end

  test "User must enter profile name" do
  user = User.new
  assert !user.save
  assert !user.errors[:profile_name].empty?
  
  end

  test "A user must have a unique profile name" do
  user = User.new
  user.profile_name = users(:alex).profile_name

  
  assert !user.save
  assert !user.errors[:profile_name].empty?
  
  end

  test "A user should have a profile without spaces" do
  user = User.new
  user.profile_name = "Spaced Out!"

  
  assert !user.save
  assert !user.errors[:profile_name].empty?
  assert user.errors[:profile_name].include?("Must be formatted correctly.")
  
  end

end

