Feature: Manage reset passwords
  In order to reset my password
	As a registered user
	I want to enter my email address and receive instructions

  Scenario:  Successfully send password reset email
     Given I am not logged in
	   And someone with the email "elad@eizesus.com" already exists
     When I am on the forgot password page
     And I fill in "email" with "elad@eizesus.com"
     And I press "Send me the Password Reset instructions"
     Then I should be on the password reset instruction page
		 And I should see "Password Reset - email sent"
		
	Scenario: Try to reset a password for an email that does not exists
     Given I am not logged in
	   And someone with the email "elad@eizesus.com" already exists
     When I am on the forgot password page
     And I fill in "email" with "elad@noteizesus.com"
     And I press "Send me the Password Reset instructions"
		 And I should see "Could not find a user with that email address"
		
	Scenario:  Reset a password with valid password and confirmation
     Given I am not logged in
	   And someone with the email "elad@eizesus.com" already exists
		 And the user with the email "elad@eizesus.com" has a reset token
     When I go to the reset password page with the reset token of "elad@eizesus.com"
     And I fill in "Password" with "12341234"
		 And I fill in "Password confirmation" with "12341234"
     And I press "Save"
     Then I should be on the login page
		 And I should see "Your password was updated successfully, Please login using your new password"

	Scenario:  Reset a password with invalid password and confirmation
     Given I am not logged in
	   And someone with the email "elad@eizesus.com" already exists
		 And the user with the email "elad@eizesus.com" has a reset token
     When I go to the reset password page with the reset token of "elad@eizesus.com"
     And I fill in "Password" with "56785678"
		 And I fill in "Password confirmation" with "12341234"
     And I press "Save"
		 And I should see "Password doesn't match confirmation" 

	Scenario:  Reset a password with blank password and confirmation
     Given I am not logged in
	   And someone with the email "elad@eizesus.com" already exists
		 And the user with the email "elad@eizesus.com" has a reset token
     When I go to the reset password page with the reset token of "elad@eizesus.com"
     And I fill in "Password" with ""
		 And I fill in "Password confirmation" with ""
     And I press "Save"
		 And I should see "Password can't be blank"