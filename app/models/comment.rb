class Comment < ActiveRecord::Base
  # validation for attributes
  validates :body, :presence => true
  
  # 1:n relation between 'comment' and 'user'
  # add this line in model 'user': 
  # ... has_many :comments
  belongs_to :person
  
  # 1:n relation between 'comment' and 'photo'
  # add this line in model 'photo': 
  # ... has_many :comments
  belongs_to :photo
  
  def created_at_date
  	created_at.to_datetime.strftime("%A %d %b %Y").squeeze(' ')
  end
  
  def is_author(current_person)
  	person.id == current_person.id
  end
end
