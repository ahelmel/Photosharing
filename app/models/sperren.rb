class Sperren < ActiveRecord::Base
	 validates :startDate, :presence => true 
	 validates :endDate, :presence => true 
	 validates :reason, :presence => true 
	 
	 belongs_to :person
end
