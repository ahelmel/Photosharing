class Photo < ActiveRecord::Base
  # add file as property 
  has_attached_file :image, :styles => { :thumb => "130x130", :medium => "360x360", :large => "520x520"}
  
  # protect some of attributes of file
  attr_protected :image_file_name, :image_content_type, :image_size
  
  # validation for attributes
  validates :title, :presence => true
  
  # validation for file
  validates_attachment_presence :image
  validates_attachment_content_type :image, :content_type => [ 'image/jpeg', 'image/png' ]
  validates_attachment_size :image, :less_than => 5.megabytes
  
  # 1:n relation between 'comment' and 'user'
  # add this line in model 'user': 
  # ... has_many :photos
  belongs_to :album
  
  # 1:n relation between 'photo' and 'user'
  # add this line in model 'user': 
  # ... has_many :photos
  belongs_to :person
  
  # 1:n relation between 'comment' and 'photo'
  # add this line in model 'comment': 
  # ... has_many :photos
  belongs_to :comment
  
  # 1:n relation between 'comment' and 'photo'
  # add this line in model 'comment': 
  # ... belongs_to :photo
  has_many :comments
  
  def created_at_date
  	created_at.to_datetime.strftime("%A %d %b %Y").squeeze(' ')
  end
  
  def number_of_comments
  	comments.count
  end
  
  def is_owner(current_person)
  	person.id == current_person.id
  end
  
  def complain
 	 Emailer.complain_email( "http://photosharing.com/bild.jpg", "Because of").deliver
  end
  
  def pageForUpdate(order, per_page)
    position = Photo.where("album_id = #{album.id} AND #{order} <= ?", self.send(order)).count
    ((0.0+position)/per_page).ceil
  end
  
  def pageForDelete(order, per_page)
    position = Photo.where("album_id = #{album.id} AND #{order} < ?", self.send(order)).count
    ((0.0+position)/per_page).ceil
  end
end
