Feature: Manage features
  In order to manage my features
	As a logged in user
	I want to be able to change edit and see my features.
  
  Scenario: Register new features
		Given I am logged in
    And I am on the new features page
		And I fill in "Title" with "Authentication"
    And I press "Create"
		Then I should see "Feature created successfully"

  # Scenario: Delete features
  #   Given the following features:
  #     ||
  #     ||
  #     ||
  #     ||
  #     ||
  #   When I delete the 3rd features
  #   Then I should see the following features:
  #     ||
  #     ||
  #     ||
  #     ||
