from pages.BasePage import BasePage


class LoginPage(BasePage):
    """Login Page of Seznam.cz"""
    URL = 'https://login.szn.cz'
    USERNAME = '#login-username'
    PASSWORD = '#login-password'
    SIGN_IN = 'button[type=submit]'
    ERROR_MSG = 'p.error i'

    @staticmethod
    def get_domain(domain):
        if domain == "Own address":
            selector = "option[data-locale='login.own']"
        else:
            selector = "option[value='" + domain + "']"
        return selector
