require 'test_helper'

class AlbumTest < ActiveSupport::TestCase
  # unit testing
  test "should not save album without title" do
	album = Album.new
	assert !album.save, "saved album without title"
  end
  
  test "should create album" do
    album = Album.new(:title => "album1")
	assert album.save, "did not create album"
  end
  
#   def setup do
#   	@album = Album.new(:title => "album1")
#   end
#   
#   def "test should create an album" do
#   	assert @album.save
#   end
#   
#   def "test should require title" do
#   	album = Album.new
#   	assert !album.save
#   end
  
  #def "test should respond to album" do
  #	photo = photos(photo)
  #	assert_respond_to photo, :album
  #end
end
