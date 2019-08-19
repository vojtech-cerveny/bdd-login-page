from selenium.webdriver.chrome.options import Options
from selenium import webdriver
from utils import utils



def before_all(context):
    chrome_options = Options()
    chrome_options.add_argument("--lang=en")

    utils.remove_images()
    context.browser = webdriver.Chrome('./chromedriver', chrome_options=chrome_options)
    context.browser.implicitly_wait(5)


def before_scenario(context, scenario):
    context.browser.delete_all_cookies()
    context.browser.refresh()


def after_all(context):
    context.browser.quit()

