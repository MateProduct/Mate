Feature: edit personal profile
  As a user of the Mate website
  I can edit my profile
  I would like to change my available time

Background: users in the database
  Given the following users exist:
    | uni          | uname     | lionmail            |   time_slot  |
    | aa1000       | aa1000    | aa1000@columbia.edu |   Monday     |
    | aa1100       | aa1100    | aa1100@columbia.edu |   Tuesday    |

Scenario: change user aa1000 available time to Tuesday
  Given I am on the course page for "aa1000"
  When  I follow "Edit profile"
  Then  I should be on the edit profile page for "aa1000"
  And   I select "Tuesday" from "Available time slot"
  And   I press "Save Changes"
  Then  I should be on the course page for "aa1000"
  Then  I should see "Available Time: Tuesday"

