Feature: Manage stocktwits_integrations
  In order to [goal]
  [stakeholder]
  wants [behaviour]
  
  Scenario: Register new stocktwits_integration
    Given I am on the new stocktwits_integration page
    And I press "Create"

  Scenario: Delete stocktwits_integration
    Given the following stocktwits_integrations:
      ||
      ||
      ||
      ||
      ||
    When I delete the 3rd stocktwits_integration
    Then I should see the following stocktwits_integrations:
      ||
      ||
      ||
      ||
