Feature: Sign up a new account
  As a student
  So that I can sign in as a user
  I want to create a account

Background: users in the database
  Given the following users exist:
    | uni          | uname     | password     | password_confirmation  |
    | aa1000       | aa1000    | 123456       | 123456                 |

Scenario: fill in sign up form correctly
  When I go to the signup page
  And I fill in "UNI" with "jc5897"
  And I fill in "Password" with "123456"
  And I fill in "Confirm Password" with "123456"
  And I fill in "User Name" with "Jiawen Chu"
  And I press "Sign up"
  Then I should be on the signin page
  And I should see "jc5897 was successfully created."

Scenario: fill different string in password and password_confirmation (sad path)
  When I go to the signup page
  And I fill in "UNI" with "jc5897"
  And I fill in "Password" with "123456"
  And I fill in "Confirm Password" with "123"
  And I fill in "User Name" with "Jiawen Chu"
  And I press "Sign up"
  Then I should see "Password confirmation doesn't match Password"

Scenario: Registered user try to sign up again (sad path)
  When I go to the signup page
  And I fill in "UNI" with "aa1000"
  And I press "Sign up"
  Then I should see "Uni has already been taken"

