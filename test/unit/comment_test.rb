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
    @comment.update_attributes(:body => "Neue Beschreibung für Foto")
    expected = Comment.find(@comment.id)
  	assert @comment.update_attributes(:body => "Neue Beschreibung für Foto") && expected.body == "Neue Beschreibung für Foto", "did not updated attributes of comment"
  end
  
  def teardown
    @comment = nil
  end
end
