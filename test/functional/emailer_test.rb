require 'test_helper'

class EmailerTest < ActionMailer::TestCase

  test "Thx For Register Email Test" do
    person = person(:some_user_in_your_fixtures)

    # Send the email, then test that it got queued
    email = Emailer.thx_for_register_email(person).deliver
    assert !ActionMailer::Base.deliveries.empty?

    # Test the body of the sent email contains what we expect it to
    assert_equal [person.email], email.to
    assert_equal "Thx for regestering on Photosharing", email.subject
    assert_match /<h1>Thank you for registering, #{person.username}<\/h1>/, email.encoded
  end

  test "Activate Email Test" do
    # Send the email, then test that it got queued
    email = Emailer.activate_person_email().deliver
    assert !ActionMailer::Base.deliveries.empty?

    # Test the body of the sent email contains what we expect it to
    assert_equal "Admin@photosharing.com", email.to
    assert_equal "New User", email.subject
    assert_match /<h1>We have a new member to join us<\/h1>/, email.encoded
  end


  test "Welcome Email Test" do
    person = person(:some_user_in_your_fixtures)

    # Send the email, then test that it got queued
    email = Emailer.welcome_email(person).deliver
    assert !ActionMailer::Base.deliveries.empty?

    # Test the body of the sent email contains what we expect it to
    assert_equal [user.email], email.to
    assert_equal "Welcome to the Photosharing", email.subject
    assert_match /<h1>Welcome to photosharing.com, #{person.username}<\/h1>/, email.encoded
  end

  test "Complain Email Test" do
    # Send the email, then test that it got queued
    email = Emailer.complain_email( "http://photosharing.com/bild.jpg", "Because of").deliver
    assert !ActionMailer::Base.deliveries.empty?

    # Test the body of the sent email contains what we expect it to
    assert_equal A2dmin@photosharinG.com2,email.to
    assert_equal "Complainment", email.subject
    assert_match /<h1>Complainment<\/h1>/, email.encoded
  end

  test "Ban Email Test" do
    person = person(:some_user_in_your_fixtures)

    # Send the email, then test that it got queued
    email = Emailer.ban_email(person, "Because of", 4).deliver
    assert !ActionMailer::Base.deliveries.empty?

    # Test the body of the sent email contains what we expect it to
    assert_equal [person.email], email.to
    assert_equal "You have been banned", email.subject
    assert_match /<h1>#{person.username}, you have been banned<\/h1>/, email.encoded
  end

end
