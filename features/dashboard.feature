# /features/dashboard.feature
@userDashboard
Feature: dashboard blocks
  In order to see my finished tasks
  As a user
  I am able to see finished task block in the dashboard

  #@javascript
  Scenario: showing the finished task block in the dashboard
    Given I log in as Jack
    And I visit "/dashboard"
    Then the response status code should be 200
    And I should see "Finished Tasks!"