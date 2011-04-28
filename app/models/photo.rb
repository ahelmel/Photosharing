class Photo < ActiveRecord::Base
  # validation for attributes
  validates :title, :presence => true
  
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
