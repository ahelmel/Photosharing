class EmailValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    record.errors[attribute] << (options[:message] || "is not an email") unless
      value =~ /^([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})$/i
  end
end

class Person < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :lockable, :timeoutable, :confirmable and :activatable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :username, :email, :password, :password_confirmation, :domain
  validates :username, :presence => true, :uniqueness => true
  validates :password, :presence => true 
  validates :email, :presence => true, :email => true
  validates :domain, :presence => true
  belongs_to :picture
  
  # 1:n relation between 'person' and 'photo'
  # add this line in model 'photo': 
  # ... belongs_to :owner
  has_many :photos
  
  # 1:n relation between 'person' and 'comment'
  # add this line in model 'comment': 
  # ... belongs_to :person
  has_many :comments
end
