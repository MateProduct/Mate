Feature: Find mates in a specific section of a course
  As a student
  So that I can find classmates to collaborate on group project
  I want to see a list of students who enrolled in the same section with their info listed

Background: this user have added current course_sec pair into profile
  Given the following courses exist
    | uni    | course_no | section_no |
    | aa1000 | COMSW4152 |    001     |
    | aa1100 | COMSW4152 |    001     |
    | aa1200 | COMSW4111 |    001     |

  And given the following users exist:
    | uni          | uname     | lionmail            |   time_slot       | password     | password_confirmation  | contact         | description                   | phone         | skills
    | aa1000       | UserName1   | aa1000@columbia.edu |   Mon Morning     | 123456       | 123456                 | Wechat: aa1000  | Chinese                       | 559-978-9812  | Ruby
    | aa1100       | UserName2    | aa1100@columbia.edu |   Wed Evening     | 123456       | 123456                 | Wechat: aa1100  | First year master student     | 559-578-9834  | Ruby
    | aa1200       | UserName3    | aa1200@columbia.edu |   Fri Afternoon   | 123456       | 123456                 | Wechat: aa1200  |  Undergrad senior             | 781-578-9816  | SQL

  Scenario: See all students' info who have enrolled in the same course and same section
    Given I am on the course_sec page of course_no "COMSW4152" sec_no "001" with uni "aa1000"
    Then I should see "Here are Mates for your class!"
    Then I should see "UserName1"
    And I should see "UserName2"
    And I should not see "UserName3"
