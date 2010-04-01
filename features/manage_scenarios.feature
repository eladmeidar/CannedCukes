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