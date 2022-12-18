Feature: Add Course
  After sign in, I want to add a course to my list of courses

  Background: this user has already added some course
    Given the following courses exist:
    | uni | course_no | section_no |
    | aa1000 | COMSW4152 | 001     |
    | aa1000 | COMSW4111 | 002     |

    And given the following users exist:
      | uni          | uname     | lionmail            |   time_slot  | password     | password_confirmation  |
      | aa1000       | aa1000    | aa1000@columbia.edu |   Monday     | 123456       | 123456                 |

    Scenario: Add a new course
      Given I am on the course page for "aa1000"
      When I follow "Add New Course"
      Then I should see "Add a new course"
      When I fill in "Course Code: e.g. COMSW4152" with "COMSW4995"
      And I fill in "Section Number: e.g. 001,002,003" with "007"
      And I press "Add"
      Then I should see "Course added successfully"


      Scenario: Add a course that already exists
        Given I am on the course page for "aa1000"
        When I follow "Add New Course"
        Then I should see "Add a new course"
        When I fill in "Course Code: e.g. COMSW4152" with "COMSW4152"
        And I fill in "Section Number: e.g. 001,002,003" with "001"
        And I press "Add"
        Then I should see "Course no already exists"


