require 'test_helper'

class CommentTest < ActiveSupport::TestCase
  setup do
    @comment = Comment.new(:body => "Beschreibung für photo1")
  end
  
  test "should not save comment without body" do
	comment = Comment.new
	assert !comment.save, "saved comment without body"
  end
  
  test "should create comment" do
	assert @comment.save, "did not create comment"
  end
  
  test "should respond to author" do
  	assert_respond_to @comment, :author, "do not belongs to author"
  end
  
  test "should respond to photos" do
  	assert_respond_to @comment, :photos, "do not have photos"
  end
  
  def teardown
    @comment = nil
  end
end
