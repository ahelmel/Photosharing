class EmailValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    record.errors[attribute] << (options[:message] || "is not an email") unless
      value =~ /^([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})$/i
  end
end

class Person < ActiveRecord::Base
  validates :username, :presence => true, :uniqueness => true
  validates :password, :presence => true 
  validates :email, :presence => true, :email => true
  validates :domain, :presence => true
  belongs_to :picture
end
