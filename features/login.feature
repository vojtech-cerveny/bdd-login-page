Feature: Login

   As a user,
   I want to login into email service or see correct warning messages what is wrong.

Scenario: Valid login
    Given I am the user "cT6J8vpJFH"
    When I fill username and valid password
    And I click on Sign in
    Then I login into email
    And I see list of emails

Scenario: Valid login with different domain
    Given I am the user "AccOnDomainFirmy"
    When I select domain "@firmy.cz" 
    Then I see, that option "@firmy.cz" is selected 

Scenario: Invalid login - wrong password
    Given I am the user "cT6J8vpJFH"
    When I fill username and "NotValidAsYouSee"
    And I click on Sign in
    Then I see error messages "Password or username is incorrect"
    And I stay on login page

Scenario: Invalid login - no password
    Given I am the user "cT6J8vpJFH"
    When I fill username
    And I click on Sign in
    Then I see error message "The password shall not be empty"
    And I stay on login page

Scenario: Invalid login - no email
    When I click on Sign in
    Then I see error message "The e-mail address shall not be empty"
    And I stay on login page

Scenario: Invalid format of email "@@@"
    Given I am on page
    When I fill email "@@@" and password
    And I click on Sign in
    Then I see error message "The e-mail address must contain exactly one at sign"
    And I see that option "Own address" is selected

Scenario: Invalid format of email "@"
    Given I am on page
    When I fill email "@" and password
    And I click on Sign in
    Then I see error message "Username is malformed"
    And I see that option "Own address" is selected

Scenario Outline: Page is corrected displayed on different resolutions
    Given browser has resolution <width> x <height>
    And I am on page
    Then Page is correctly displayed

Examples:
| Type      | Width | Height |
| Desktop   | 1280  | 800    |
| Tablet    | 768   | 1024   |
| Mobile    | 411   | 731    | 

