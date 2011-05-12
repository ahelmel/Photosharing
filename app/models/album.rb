class Album < ActiveRecord::Base
  # validation for attributes
  validates :title, :presence => true
  
  # 1:n relation between 'album' and 'photo'
  # add this line in model 'album': 
  # ... belongs_to :album
  has_many :photos
end
