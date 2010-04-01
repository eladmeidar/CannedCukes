Given /^someone with the email "([^\"]*)" already exists$/ do |email|
  User.make(:email => email)
end

Given /^the user with the email "([^\"]*)" has a reset token$/ do |email|
  user = User.find(:first, :conditions => {:email => email})
  user.make_reset_token
end