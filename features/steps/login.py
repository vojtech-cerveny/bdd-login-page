from behave import given, when, then
from nose.tools import assert_in, assert_equal, assert_true, assert_less
from selenium.webdriver.support import expected_conditions
from selenium.webdriver.support.wait import WebDriverWait

from utils import utils
from pages.LoginPage import *
from pages.EmailBoxPage import *


@given('I am on login page')
def step(context):
    context.browser.get(LoginPage.URL)


@given('browser has resolution {width} x {height}')
def step(context, width, height):
    context.browser.set_window_size(int(width), int(height))


@when('I fill username "{user}"')
def step(context, user):
    context.browser.find_element_by_css_selector(LoginPage.USERNAME).send_keys(user)


@when('I fill password "{password}"')
def step(context, password):
    context.browser.find_element_by_css_selector(LoginPage.PASSWORD).send_keys(password)


@when('I click on Sign in')
def step(context):
    context.browser.find_element_by_css_selector(LoginPage.SIGN_IN).click()


@when('I take a screenshot for {name}')
def step(context, name):
    context.browser.save_screenshot('./temp/' + name.casefold() + '.png')


@when('I select domain "{domain}"')
def step(context, domain):
    context.browser.find_element_by_css_selector(LoginPage.get_domain(domain)).click()


@then('I see error message "{error}"')
def step(context, error):
    assert_true(context.browser.find_element_by_css_selector(LoginPage.ERROR_MSG).text, error)


@then('I see, that option "{domain}" is selected')
def step(context, domain):

    assert_equal(
        context.browser.find_element_by_css_selector(LoginPage.get_domain(domain)).get_attribute("selected"),
        "true")


@then('I login into email')
def step(context):
    WebDriverWait(context.browser, 10).until(
        expected_conditions.title_contains(EmailBoxPage.SUFFIX_TITLE)
    )
    assert_in("Seznam Email", context.browser.title)


@then('I see list of emails')
def step(context):
    emails = context.browser.find_elements_by_css_selector(EmailBoxPage.EMAILS)
    assert_equal(len(emails), 1)


@then('I stay on login page')
def step(context):
    assert_in(LoginPage.URL, context.browser.current_url)


@then('Page is correctly displayed on {name}')
def step(_, name):
    assert_less(utils.compare_images(name.casefold()), 10)
