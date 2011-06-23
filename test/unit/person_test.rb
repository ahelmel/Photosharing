require 'test_helper'

class PersonTest < ActiveSupport::TestCase
  setup do
    @person = Person.new(:username => "Admin", :password => "abc123", :domain => "Munich", :email => "admin@theWeb.de", :lastName => "Mustermann", :firstName => "Max", :status => true, :blockedTo => "20.05.2011", :typ => "2")
  end
 
  test "shouldn't save without username password domain email" do
    person = Person.new
	assert !person.save, "shouldn't save person"
  end
  
  test "shouldn't save without email" do
    person = Person.new(:username => "Admin", :password => "abc123", :domain => "Munich")
	assert !person.save, "shouldn't save person"
  end
  
  test "shouldn't save without domain" do
    person = Person.new(:username => "Admin", :password => "abc123", :email => "admin@theWeb.de")
	assert !person.save, "shouldn't save person"
  end 
  
  test "shouldn't save without password" do
    person = Person.new(:username => "Admin", :domain => "Munich", :email => "admin@theWeb.de")
	assert !person.save, "shouldn't save person"
  end 
  
  test "shouldn't save without username" do
    person = Person.new(:password => "abc123", :domain => "Munich", :email => "admin@theWeb.de")
	assert !person.save, "shouldn't save person"
  end 
  
  test "should save Person" do 
	assert @person.save, "should have saved Person"
  end  
    
  test "ckeck if last Name ist saved correct" do 
	person = Person.new(:username => "Admin", :password => "abc123", :domain => "Munich", :email => "admin@theWeb.de", :lastName => "Mustermann")
	person.save 
	assert_equal(person.lastName, "Mustermann", "Lastname wasn't saved.")
  end 

   test "ckeck if first Name ist saved correct" do 
	person = Person.new(:username => "Admin", :password => "abc123", :domain => "Munich", :email => "admin@theWeb.de", :firstName => "Max")
	person.save 
	assert_equal(person.firstName, "Max", "Firstname wasn't saved.")
  end
  
  test "ckeck if Domain ist saved correct" do 
	person = Person.new(:username => "Admin", :password => "abc123", :domain => "Munich", :email => "admin@theWeb.de")
	person.save 
	assert_equal(person.domain, "Munich", "Lastname wasn't saved.")
  end
  
  test "ckeck if Status ist saved correct" do 
	person = Person.new(:username => "Admin", :password => "abc123", :domain => "Munich", :email => "admin@theWeb.de", :status => true)
	person.save 
	assert person.status, "Status didn't got saved."
  end
  
  test "ckeck if blockedTo ist saved correct" do 
	person = Person.new(:username => "Admin", :password => "abc123", :domain => "Munich", :email => "admin@theWeb.de", :blockedTo => "20.05.2011")
	person.save 
	assert_equal(person.blockedTo.to_s, '2011-05-20', "Blocked date wasn't saved.")
  end
  
  test "ckeck if typ ist saved correct" do 
	person = Person.new(:username => "Admin", :password => "abc123", :domain => "Munich", :email => "admin@theWeb.de", :typ => "2")
	person.save 
	assert_equal(person.typ, 2, "Typ wasn't saved.")
  end
  
  test "ckeck if signatur ist saved correct" do 
	person = Person.new(:username => "Admin", :password => "abc123", :domain => "Munich", :email => "admin@theWeb.de", :signatur => "This is a text, as Signatur")
	person.save 
	assert_equal(person.signatur, "This is a text, as Signatur", "Signatur wasn't saved.")
  end
  
  test "test unique user name " do 
	@person.save 
	person = Person.new(:username => "Admin", :password => "abc123", :domain => "Munich", :email => "admin@theWeb.de")
	assert !person.save, "shouldn't save secound Admin"
  end
  
  test "e-mail have to be valid, without @" do
	person = Person.new(:username => "Admin", :password => "abc123", :domain => "Munich", :email => "admintheWeb.de")
	assert !person.save, "False Mailadresse was accepted"
  end
 
  test "e-mail have to be valid, without domain" do
	person = Person.new(:username => "Admin", :password => "abc123", :domain => "Munich", :email => "admin@theWeb")
	assert !person.save, "False Mailadresse was accepted"
  end
  
  test "e-mail have to be valid, with unallowed symbols" do
	person = Person.new(:username => "Admin", :password => "abc123", :domain => "Munich", :email => "admin@the|Web.de")
	assert !person.save, "False Mailadresse was accepted"
  end
  
  def teardown
    @person = nil
  end
end
