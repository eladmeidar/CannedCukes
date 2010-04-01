Feature: Sign up
  As a user
  I want to sign up
  So that I can log in

  Scenario:  Navigating to the Sign Up page
    Given I am not logged in
    When I am on the home page
    And I follow "Sign up"
    Then I should be on the signup page
    
    Scenario:  Create fails when creating an existing user
      Given I am not logged in
      And someone with the login "testing" already exists
      When I am on the signup page
      And I fill in "Login" with "testing"
      And I fill in "Email" with "test@testing.com"
      And I fill in "Password" with "password"
      And I fill in "Confirm Password" with "password"    
      And I press "Sign up"
      Then I should see "Login has already been taken"
      And I should not be logged in
      
    Scenario:  Create fails when given an invalid email
      Given I am not logged in
      When I am on the signup page
      And I fill in "Login" with "testing"
      And I fill in "Email" with "invalid.email"
      And I fill in "Password" with "password"
      And I fill in "Confirm Password" with "password"    
      And I press "Sign up"
      Then I should see "Email should look like an email address"
      And I should not be logged in

    Scenario:  Create fails when no password is given
      Given I am not logged in
      When I am on the signup page
      And I fill in "Login" with "testing"
      And I fill in "Email" with "test@testing.com"
      And I press "Sign up"
      Then I should see "Password can't be blank"
      And I should not be logged in

    Scenario:  Create fails when no password confirmation is given
      Given I am not logged in
      When I am on the signup page
      And I fill in "Login" with "testing"
      And I fill in "Email" with "test@testing.com"
      And I fill in "Password" with "password"      
      And I press "Sign up"
      Then I should see "Password confirmation can't be blank"
      And I should not be logged in

    Scenario:  Create successful when given valid parameters
      Given I am not logged in
      When I am on the signup page
      And I fill in "Login" with "testing"
      And I fill in "Email" with "test@testing.com"
      And I fill in "Password" with "password"
      And I fill in "Confirm Password" with "password"
      And I press "Sign up"
      Then I should be on the activation page
      
      And I should not be logged in
      