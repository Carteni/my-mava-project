Feature: about page
  In order to see about page contents
  As a user
  I am able to visit about page

  @javascript
  Scenario: Visit about page
    Given I am on "/about"
    Then I should see "Mava"

  @javascript
  Scenario: Visiting about page for an existing user
    Given I am on "/about/john"
    Then I should see "Name"

  @javascript
  Scenario: Visiting about page for non existing user
    Given I am on "/about/jim"
    Then I should see "Not Found"

  @javascript
  Scenario: Showing details of an existing user in about page
    Given I am on "/about/john"
    When I press more
    Then I should see "email"