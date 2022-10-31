Feature: Sign up a new account
  As a student
  So that I can sign in as a user
  I want to create a account

Background: users in the database
  Given the following users exist:
    | uni          | uname     | lionmail            |   time_slot  |
    | aa1000       | aa1000    | aa1000@columbia.edu |   Monday     |
    | aa1100       | aa1100    | aa1100@columbia.edu |   Tuesday    |

Scenario: fill in sign up form correctly
  When I go to the signup page
  And I fill in "UNI" with "jc5897"
  And I fill in same string in password and confirm password
  And I press "Sign up"
  Then I should be on sign in page
  And I should see "jc5897 was successfully created."

Scenario: fill different string in password and password_confirmation (sad path)
  When I go to the signup page
  And I fill in "UNI" with "jc5897"
  And I fill in different string in password and confirm password
  And I press "Sign up"
  Then I should see "password confirmation failed"

Scenario: Registered user try to sign up again (sad path)
  When I go to the signup page
  And I fill in "UNI" with "jc5897"
  And I fill in same string in password and confirm password
  And I press "Sign up"
  Then I should see "Account creation failed. Please check if UNI is already registered."

