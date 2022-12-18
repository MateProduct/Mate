Feature: edit personal profile
  As a user of the Mate website
  I can edit my profile
  I would like to change my available time

Background: users in the database
  Given the following users exist:
    | uni          | uname     | lionmail            |   time_slot       | password     | password_confirmation  |  skills |
    | aa1000       | aa1000    | aa1000@columbia.edu |   Mon Morning     | 123456       | 123456                 |  Ruby   |
    | aa1100       | aa1100    | aa1100@columbia.edu |   Tues Morning    | 123456       | 123456                 |  Ruby   |

Scenario: change user aa1000 phone number to 123456789
  Given I am on the course page for "aa1000"
  When  I follow "Edit User Profile"
  Then  I should be on the edit profile page for "aa1000"
  When  I fill in "Phone" with "123456789"
  And   I press "Save Changes"
  Then  I should be on the course page for "aa1000"
  Then  I should see "123456789"

  Scenario: change user aa1000 user name to 123456789
    Given I am on the course page for "aa1000"
    When  I follow "Edit User Profile"
    Then  I should be on the edit profile page for "aa1000"
    When  I fill in "User name" with "John Smith"
    And   I press "Save Changes"
    Then  I should be on the course page for "aa1000"
    Then  I should see "John Smith"

  Scenario: change user aa1000 phone number to 123456789
    Given I am on the course page for "aa1000"
    When  I follow "Edit User Profile"
    Then  I should be on the edit profile page for "aa1000"
    When  I fill in "Lionmail" with "aa1001@columbia.edu"
    And   I press "Save Changes"
    Then  I should be on the course page for "aa1000"
    Then  I should see "aa1001@columbia.edu"

  Scenario: change user aa1000 contact to WeChat: aa1000
    Given I am on the course page for "aa1000"
    When  I follow "Edit User Profile"
    Then  I should be on the edit profile page for "aa1000"
    When  I fill in "Contact" with "WeChat: aa1000"
    And   I press "Save Changes"
    Then  I should be on the course page for "aa1000"
    Then  I should see "WeChat: aa1000"

  Scenario: change user aa1000 description to master student
    Given I am on the course page for "aa1000"
    When  I follow "Edit User Profile"
    Then  I should be on the edit profile page for "aa1000"
    When  I fill in "About Me" with "master student"
    And   I press "Save Changes"
    Then  I should be on the course page for "aa1000"
    Then  I should see "master student"