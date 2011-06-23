require 'test_helper'

class PhotoTest < ActiveSupport::TestCase
  setup do
  	@title1 = "photo1"
  	@title2 = "photo2"
  	@file1 = File.new(Rails.root.join("test/fixtures/15.jpg"))
  	@file2 = File.new(Rails.root.join("test/fixtures/13.jpg"))
  	@comment1 = Comment.new(:body => "Beschreibung für photo1")
  	@photo = Photo.new(:title => @title1, :image => @file1, :comments => [ @comment1 ])
  end
  
  test "should not save photo without title" do
  	photo1 = Photo.new
	photo2 = Photo.new(:image => @file1)
	assert !photo1.save && !photo2.save, "saved photo without title"
  end
  
  test "should not save photo without image" do
	photo = Photo.new(:title => @title1)
	assert !photo.save, "saved photo without image"
  end
  
  test "should create photo" do
	assert @photo.save, "did not create photo"
  end
  
  test "should belong to owner" do
  	@photo.save
  	assert_respond_to @photo, :owner, "do not belongs to owner"
  	owner = @photo.owner
  	if owner
  	  assert_kind_of Person, owner, "owner of wrong type"
  	end
  end
  
  test "should belong to album" do
    @photo.save
  	assert_respond_to @photo, :album, "do not belongs to album"
  	album = @photo.album
  	if album
  	  assert_kind_of Album, album, "album of wrong type"
  	end
  end
  
  test "should belong to comment" do
  	@photo.save
  	assert_respond_to @photo, :comment, "do not belongs to comment"
  	comment = @photo.comment
  	if comment
  	  assert_kind_of Comment, comment, "comment of wrong type"
  	end
  end
  
  test "should respond to comments" do
  	@photo.save
  	assert_respond_to @photo, :comments, "do not have comments"
  	comment = @photo.comments.first
  	if comment
  	  assert_kind_of Comment, comment, "comment of wrong type"
  	end
  end
  
  test "should delete photo" do
    @photo.save
    expected = @photo.id
    assert @photo.destroy, "did not deleted photo"
    assert_raise ActiveRecord::RecordNotFound do
    	Photo.find(expected)
    end
  end
  
  test "should update attributes of photo" do
    @photo.save
    update = @photo.update_attributes(:title => @title2, :image => @file2)
    expected = Photo.find(@photo.id)
  	assert update && expected.title == @title2 && expected.image_file_name == File.basename(@file2.path), "did not updated attributes of photo"
  end
  
  test "should upload photo" do
  	#image = ""
  	#file = Rack::Test::UploadedFile.new(image, "image/png")
  	#???
  	# check if uploaded file is present in image directory
	#@photo.attachment = File.new("test/fixtures/sample_file.png")
	#file = File.new("../test/fixtures/15.jpg")
	#photo = Photo.new(:title => "photo1", :image => file)
	#assert photo.save
  end
  
  def teardown
    @photo = nil
  end
end
