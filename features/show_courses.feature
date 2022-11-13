Feature: show joined courses
  As a user of the Mate website
  I want to see all courses I have joined

  Background: this user has already added some course
    Given the following users exist:
      | uni          | uname     | lionmail            |   time_slot       | password     | password_confirmation  |
      | aa1000       | aa1000    | aa1000@columbia.edu |   Mon Morning     | 123456       | 123456                 |

    And given the following courses exist:
      | uni | course_no | section_no |
      | aa1000 | COMSW4152 | 001     |
      | aa1000 | COMSW4111 | 002     |


  Scenario: show all courses user aa1000 joined
    Given I am on the course page for "aa1000"
    Then  I should see "COMSW4152"
    Then  I should see "COMSW4111"
    Then  I should not see "COMSW4156"

