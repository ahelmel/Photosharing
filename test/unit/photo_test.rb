require 'test_helper'

class PhotoTest < ActiveSupport::TestCase
  setup do
    @photo = Photo.new(:title => "photo1")
  end
  
  test "should not save photo without title" do
	photo = Photo.new
	assert !photo.save, "saved photo without title"
  end
  
  test "should create photo" do
	assert @photo.save, "did not create photo"
  end
  
  test "should respond to owner" do
  	assert_respond_to @photo, :owner, "do not belongs to owner"
  end
  
  test "should respond to comment" do
  	assert_respond_to @photo, :comment, "do not belongs to comment"
  end
  
  test "should respond to comments" do
  	assert_respond_to @photo, :comments, "do not have comments"
  end
end
