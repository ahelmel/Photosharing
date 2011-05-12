class Photo < ActiveRecord::Base
  # add file as property 
  has_attached_file :image, :styles => { :thumb => "100x100" }
  
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
  belongs_to :owner
  
  # 1:n relation between 'comment' and 'photo'
  # add this line in model 'comment': 
  # ... has_many :photos
  belongs_to :comment
  
  # 1:n relation between 'comment' and 'photo'
  # add this line in model 'comment': 
  # ... belongs_to :photo
  has_many :comments
end
