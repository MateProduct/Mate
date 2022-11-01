Feature: Sign in with an account
  After registered, I want to sign in with my account.

Background: users in the database
  Given the following users exist:
    | uni          | uname     | password     | password_confirmation  |
    | aa1000       | aa1000    | 123456       | 123456                 |


Scenario: fill in sign in form correctly
  When I go to the signin page
  And I fill in "UNI" with "aa1000"
  And I fill in "Password" with "123456"
  And I press "Sign in"
  Then I should be on the course page for "aa1000"

Scenario: fill the wrong password (sad path)
  When I go to the signin page
  And I fill in "UNI" with "aa1000"
  And I fill in "Password" with "111111"
  And I press "Sign in"
  Then I should see "Invalid password. Please try again."

Scenario: trying to sigin without registered (sad path)
  When I go to the signin page
  And I fill in "UNI" with "lx2301"
  And I fill in "Password" with "111111"
  And I press "Sign in"
  Then I should see "lx2301 hasn't been signup. Please signup first"
  And I should be on the signup page

