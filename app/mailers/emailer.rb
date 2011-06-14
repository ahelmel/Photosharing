class Emailer < ActionMailer::Base
  default :from => "no-reply@photosharing.com"

  def thx_for_register_email(person)
	@person = person
	mail(:to => person.email, :subject => "Thx for regestering on Photosharing")
  end

  def activate_person_email()
	mail(:to => "Admin@photosharing.com", :subject => "New User")
  end

  def welcome_email(person)
	@person = person    
	@url  = "http://photosharing.com/login"
	mail(:to => person.email, :subject => "Welcome to the Photosharing")
  end

  def complain_email(url, reason, person)
	@url = url
	@reason = reason
	@person = person
	mail(:to => "Admin@photosharing.com", :subject => "Complainment")
  end

  def ban_email(person, reason, days)
	@person = person
	@reason = reason
	@days = days
	mail(:to => person.mail, :subject => "You have been banned")
  end

end
