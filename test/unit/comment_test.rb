require 'test_helper'

class CommentTest < ActiveSupport::TestCase
  setup do
  	@body1 = "Beschreibung für photo1"
  	@body2 = "Beschreibung für photo2"
    @comment = Comment.new(:body => @body1)
  end
  
  test "should not save comment without body" do
	comment = Comment.new
	assert !comment.save, "saved comment without body"
  end
  
  test "should create comment" do
	assert @comment.save, "did not create comment"
  end
  
  test "should respond to author" do
  	@comment.save
  	assert_respond_to @comment, :author, "do not belongs to author"
  	author = @comment.author
  	if author
  	  assert_kind_of Person, author, "author of wrong type"
  	end
  end
  
  test "should respond to photos" do
  	@comment.save
  	assert_respond_to @comment, :photos, "do not belongs to photo"
  	photo = @comment.photo
  	if photo
  	  assert_kind_of Photo, photo, "photo of wrong type"
  	end
  end
  
  test "should delete comment" do
    @comment.save
    expected = @comment.id
    assert @comment.destroy, "did not deleted comment"
    assert_raise ActiveRecord::RecordNotFound do
    	Comment.find(expected)
    end
  end
  
  test "should update attributes of comment" do
    @comment.save
    @comment.update_attributes(:body => @body2)
    expected = Comment.find(@comment.id)
  	assert @comment.update_attributes(:body => @body2) && expected.body == @body2, "did not updated attributes of comment"
  end
  
  def teardown
    @comment = nil
  end
end
