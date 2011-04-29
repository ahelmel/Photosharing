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
  
  test "should delete album" do
    @album.save
    assert @album.destroy, "did not deleted album"
  end
  
  test "should update attributes of album" do
    @album.save
    @album.update_attributes(:title => "neues album1")
    expected = Album.find(@album.id)
  	assert @album.update_attributes(:title => "neues album1") && expected.title == "neues album1", "did not updated attributes of album"
  end
  
  def teardown
    @album = nil
  end
end
