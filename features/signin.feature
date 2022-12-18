Feature: Sign in with an account
  After registered, I want to sign in with my account.

Background: users in the database
  Given the following users exist:
    | uni          | uname     | password     | password_confirmation  | email_confirmed | confirm_token |
    | aa1000       | aa1000    | 123456       | 123456                 | true            | nil           |


Scenario: fill in sign in form correctly
  When I go to the signin page
  And I fill in "Lion Mail" with "aa1000"
  And I fill in "Password" with "123456"
  And I press "Sign in"
  Then I should be on the course page for "aa1000"

Scenario: fill the wrong password (sad path)
  When I go to the signin page
  And I fill in "Lion Mail" with "aa1000"
  And I fill in "Password" with "111111"
  And I press "Sign in"
  Then I should see "Invalid password. Please try again."

Scenario: fill the empty uni (sad path)
  When I go to the signin page
    And I fill in "Lion Mail" with ""
    And I fill in "Password" with "111"
    And I press "Sign in"
    Then I should see "Please enter UNI."


Scenario: fill the empty password (sad path)
    When I go to the signin page
        And I fill in "Lion Mail" with "aa1000"
        And I fill in "Password" with ""
        And I press "Sign in"
        Then I should see "Please enter password."

Scenario: trying to sigin without registered (sad path)
  When I go to the signin page
  And I fill in "Lion Mail" with "lx2301"
  And I fill in "Password" with "111111"
  And I press "Sign in"
  Then I should see "lx2301 hasn't been signup. Please signup first"
  And I should be on the signup page

