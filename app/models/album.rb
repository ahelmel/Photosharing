class Album < ActiveRecord::Base
  # validation for attributes
  validates :title, :presence => true
  
  # 1:n relation between 'album' and 'photo'
  # add this line in model 'album': 
  # ... belongs_to :album
  has_many :photos
  
  def created_at_date
  	created_at.to_datetime.strftime("%A %d %b %Y").squeeze(' ')
  end
  
  def number_of_photos
  	photos.count
  end
  
  def last_photo
  	photos.last
  end
  
  def pageForUpdate(order, per_page)
    position = Album.where("#{order} <= ?", self.send(order)).count
    ((0.0+position)/per_page).ceil
  end
  
  def pageForDelete(order, per_page)
    position = Album.where("#{order} < ?", self.send(order)).count
    ((0.0+position)/per_page).ceil
  end
end
