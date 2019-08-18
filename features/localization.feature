Feature: Localization

   As user, I want to see page in my language 
   or I should be able to change language of page.

Scenario Outline: Page has same language as browser
    Given browser language is set as <language>
    When I visit page
    Then I see h1 text <h1>
    And I see h2 text <h2>
    And Language is set to <language>
    And Email label is <email_label>
    And Password label is <password_label>
    And Problem text is <problems>
    And button for login has <buttonSignIn> label
    And registration text is <registration>
    And Improve security text is <security>
    And Footer has <footer>
    And title is <title>

Examples:
| Language  | h1                | h2                                        | email_label       | password_label    | problems                  | buttonSignIn  | registration                                                  | security                                      | footer                                                            | title
| English   | Sign in to Email  | One account for everything Seznam offers  | Email address     | Password          | Problems signing in?      | Sign in       | If you don’t have an account yet, you can sign up here.       | Improve the security of your sign-in.         | Copyright © 1996–2019 Seznam.cz, a.s.\n\nHelp – Advertisement     | Sign in     
| Čeština   | Přihlášení        | Jeden účet pro všechno od Seznamu         | E-mailová adresa  | Heslo             | Nemůžete se přihlásit?    | Přihlásit se  | Pokud ještě nemáte účet, tady si ho vytvoříte.                | Zabezpečte si lépe své přihlašování.          | Copyright © 1996–2019 Seznam.cz, a.s.\n\nNápověda – Reklama       | Přihlášení
| Slovensky | Prihlásenie       | Jeden účet pre všetko od Seznamu          | E-mailová adresa  | Heslo             | Nemôžete sa prihlásiť?    | Prihlásiť sa  | Ak ešte nemáte účet, tu si ho vytvoríte.                      | Zabezpečte si lepšie svoje prihlasovanie.     | Copyright © 1996–2019 Seznam.cz, a.s.\n\nNápoveda – Reklama       | Prihlásenie
| Deutsch   | Anmeldung         | Ein Konto für alles von Seznam            | E-Mail Adresse    | Passwort          | Probleme beim Einloggen?  | Anmelden      | Wenn Sie noch kein Konto haben, können Sie sich hier anmelden.| Verbessern Sie die Sicherheit Ihrer Anmeldung.| Copyright © 1996–2019 Seznam.cz, a.s.\n\nHilfe – Werbung          | Anmeldung


Scenario Outline: Change default language
    Given browser language is set as "English"
    When I visit page
    And I change language to <language>
    Then language of page is set correctly to <language>