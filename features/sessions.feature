Feature:  Logging in
  As a user
  I want to log in
  So that I can use the application

  Scenario:  Navigating to the Login page
    Given I am not logged in
    When I follow "Log in"
    Then I should be on the login page

  Scenario:  Existing user can log in
    Given I am not logged in
    And someone with the login "testing" already exists
    When I am on the login page
    And I fill in "Login" with "testing"
    And I fill in "Password" with "testing"
    And I press "Log in" 
    Then I should be on the dashboard page
    And I should be logged in
    And I should not have a remember token

  Scenario:  Existing user can log in and be remembered
    Given I am not logged in
    And someone with the login "testing" already exists
    And I am on the login page
    When I fill in "Login" with "testing"
    And I fill in "Password" with "testing"
    And I check "remember_me"
    And I press "Log in"
    Then I should be on the dashboard page
    And I should be logged in
    And I should have a remember token
   
  Scenario:  Logged in user who fails log in should be logged out
    Given I am logged in
    And I am on the login page
    When I fill in "Login" with "testing"
    And I fill in "Password" with "testing1234fail"
    And I press "Log in"
    Then I should see "Couldn't log you in as 'testing'"    
    And  I should not be logged in
    
  Scenario:  Logging in with an invalid login should fail
    Given I am not logged in
    And someone with the login "testing" already exists
    And I am on the login page
    When I fill in "Login" with "testing123"
    And I fill in "Password" with "testing"
    And I press "Log in"
    Then I should see "Couldn't log you in as 'testing123'"
    And I should not be logged in
  
  Scenario:  Logging in with an invalid password should fail
    Given I am not logged in
    And someone with the login "testing" already exists
    When I go to the login page
    And I fill in "Login" with "testing"
    And I fill in "Password" with "testing123"
    And I press "Log in"
    Then I should see "Couldn't log you in as 'testing'"
    And I should not be logged in

  Scenario:  Logged out user can log out
    Given I am not logged in
    And I am on the home page
    When I go to the logout page
    Then I should see "You have been logged out"
    And I should be on the home page
    And I should not be logged in
    
  Scenario:  Logged in user can log out
    Given I am logged in
    And I am on the home page
    When I follow "Log out"
    Then I should see "You have been logged out"
    And I should be on the home page
    And I should not be logged in