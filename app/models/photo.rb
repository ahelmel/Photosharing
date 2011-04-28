class Photo < ActiveRecord::Base
  # validation for attributes
  validates :title, :presence => true
  
  # 1:n relation between 'comment' and 'user'
  # add this line in model 'user': 
  # ... has_many :comments
  belongs_to :owner
end
