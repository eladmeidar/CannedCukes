Given /^I am not logged in$/ do
  visit '/logout'
end

Given /^I am logged in$/ do
  user = User.make
  user.activate!
  visit '/login'
  fill_in 'login', :with => user.login
  fill_in 'password', :with => user.password
  click_button 'Log in'
end

Then /^I should not be logged in$/ do
  controller.current_user.should be_nil
end

Then /^I should be logged in$/ do
  controller.current_user.should_not be_nil
end

Given /^someone with the login "([^\"]*)" already exists$/ do |login|
  user = User.make(:login => login)
  user.activate!
end

Then /^I should have a remember token$/ do
  controller.current_user.remember_token.should_not be_nil
end

Then /^I should not have a remember token$/ do
  controller.current_user.remember_token.should be_nil
end
