@ManageSettings
Feature: Manage Settings

  @manage_call_forward_test
  Scenario: Check call forwarding
    Given I login to the login page
    When I click on my first simplan
    And I click on the Settings link
    Then the settings page is displayed

    When I click on Edit link of Call Forwarding
    And I click on Confirm button on the confirmation box
    And I click on the "Yes" radio button
    And I enter "0412345678" on the forward calls input box
    And I click Save
    Then I should see the sucess message
    And I should see "Yes" on the call forwarding area of the settings page




