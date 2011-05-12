class Comment < ActiveRecord::Base
  # validation for attributes
  validates :body, :presence => true
  
  # 1:n relation between 'comment' and 'user'
  # add this line in model 'user': 
  # ... has_many :comments
  belongs_to :author
  
  # 1:n relation between 'comment' and 'photo'
  # add this line in model 'photo': 
  # ... has_many :comments
  belongs_to :photo
end
