from pages.BasePage import BasePage


class EmailBoxPage(BasePage):
    """Emails box page"""
    SUFFIX_TITLE = "Seznam Email"
    EMAILS = ".message-list.no-folder > li"
