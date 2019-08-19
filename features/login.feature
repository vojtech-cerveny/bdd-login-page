Feature: Login

  As a user,
  I want to login into email service or see correct warning messages what is wrong.

  Scenario: Can select different domain
    Given I am on login page
    When I select domain "@firmy.cz"
    Then I see, that option "@firmy.cz" is selected

  Scenario: Invalid login - wrong password
    Given I am on login page
    When I fill username "cT6J8vpJFH"
    And I fill password "NotValidAsYouSee"
    And I click on Sign in
    Then I see error message "Password or username is incorrect"
    And I stay on login page

  Scenario: Invalid login - no password
    Given I am on login page
    When I fill username "cT6J8vpJFH"
    And I click on Sign in
    Then I see error message "The password shall not be empty"
    And I stay on login page

  Scenario: Invalid login - no email
    Given I am on login page
    When I click on Sign in
    Then I see error message "The e-mail address shall not be empty"
    And I stay on login page

  Scenario Outline: Invalid format of email
    Given I am on login page
    When I fill username <username>
    And I fill password <password>
    And I click on Sign in
    Then I see error message <error_msg>
    And I see, that option "Own address" is selected

    Examples:
    | username | password | error_msg |
    | "@@@"    | "Bob"    | "The e-mail address must contain exactly one at sign" |
    | "@"      | "Bob"    | "Username is malformed" |

  Scenario Outline: Page is corrected displayed on different resolutions ( >5% diff from base image )
    Given browser has resolution <Width> x <Height>
    And I am on login page
    When I take a screenshot for <Type>
    Then Page is correctly displayed on <Type>

    Examples:
      | Type    | Width | Height |
      | Desktop | 1280  | 800    |
      | Tablet  | 768   | 1024   |
      | Mobile  | 411   | 731    |

  Scenario: Valid login
    Given I am on login page
    When I fill username "cT6J8vpJFH"
    And I fill password "AMKfbu4G4R"
    And I click on Sign in
    Then I login into email
    And I see list of emails

  @skip
  Scenario: All links returns status code 200
