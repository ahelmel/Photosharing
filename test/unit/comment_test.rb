require 'test_helper'

class CommentTest < ActiveSupport::TestCase
  # unit testing
  test "should not save comment without body" do
	comment = Comment.new
	assert !comment.save, "saved comment without body"
  end
  
  test "should create comment" do
    comment = Comment.new(:body => "Beschreibung für photo1")
	assert comment.save, "did not create comment"
  end
  
  test "should respond to author" do
  	comment = Comment.new(:body => "Beschreibung für photo1")
  	assert_respond_to comment, :author, "do not belongs to author"
  end
  
  test "should respond to photos" do
  	comment = Comment.new(:body => "Beschreibung für photo1")
  	assert_respond_to comment, :photos, "do not have photos"
  end
end
