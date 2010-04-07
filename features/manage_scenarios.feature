Feature: Manage scenarios
  In order to manage scenarios
	As a logged in users
	I want to access and change my scenarios
  
  Scenario: Register new scenarios
		Given I am logged in
		And the following features:
		| title          |
		| Authentication |
		| Registration   |
		| Awesomeness    |
    And I am on the new scenario page
		When I fill in "Title" with "Register new scenarios"
		And I select "Authentication" from "Feature"
		And I fill in "Body" with "Scenario: bla bla bla"
    And I press "Create"
		Then I should see "Scenario successfully created."
		
	Scenario: Edit scenario
		Given I am logged in
		And the following features:
		| title          |
		| Authentication |
		| Registration   |
		| Awesomeness    |
		And the following scenarios for the "Authentication" feature:
		 | title                     | body                                                    |
		 | Logging in with telepathy | Given i am david coperfield And i focus i should log in |
    And I am on my "Authentication" feature page
		When I edit the "Authentication" feature 1st scenario
		And I fill in "Title" with "Logging in using the power of mind"
    And I press "Save"
		Then I should see "Scenario updated successfully"
		And I should see "Logging in using the power of mind"
		
	Scenario: Search without being logged in
		Given I am not logged in
		And the following features:
		| title          |
		| Authentication |
		| Registration   |
		| Awesomeness    |
		And the following scenarios for the "Authentication" feature:
		 | title                     | body                                                    |
		 | Logging in with telepathy | Given i am david coperfield And i focus i should log in |
		And I am on the home page
		And I follow "Search Scenarios"
		And I fill in "q" with "telepathy"
		Then I should see "Logging in with telepathy"