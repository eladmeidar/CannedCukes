Feature: Manage features
  In order to manage my features
	As a logged in user
	I want to be able to change edit and see my features.
  
  Scenario: Register new valid feature
		Given I am logged in
    And I am on my new features page
		And I fill in "Title" with "Authentication"
    And I press "Create"
		Then I should see "Feature created successfully"

  Scenario: Register new invalid feature (without title)
		Given I am logged in
    And I am on my new features page
		When I fill in "Title" with ""
    And I press "Create"
		Then I should see "Title can't be blank"

  Scenario: Edit feature
		Given I am logged in
		And the following features:
		| title          |
		| Authentication |
		| Registration   |
		| Awesomeness    |
    And I am on my features page
		When I edit the 1st feature
		And I fill in "Title" with "Super authentication"
    And I press "Save"
		Then I should see "Feature updated successfully"
		And I should see "Super authentication"
	
	Scenario: Destroy a feature
		Given I am logged in
		And the following features:
		| title          |
		| Authentication |
		| Registration   |
		| Awesomeness    |
    And I am on my features page
		When I delete the 1st feature
		Then I should see "Feature deleted successfully"
		And I should not see "Registration"