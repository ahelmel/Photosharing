require 'test_helper'

class AlbumTest < ActiveSupport::TestCase
  setup do
    @album = Album.new(:title => "album1")
  end
  
  test "should not save album without title" do
	album = Album.new
	assert !album.save, "saved album without title"
  end
  
  test "should create album" do
	assert @album.save, "did not create album"
  end
  
  def teardown
    @album = nil
  end
end
