class Album < ActiveRecord::Base
  # validation for attributes
  validates :title, :presence => true
end
