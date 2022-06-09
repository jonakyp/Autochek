import os
import random
from multiprocessing.sharedctypes import synchronized

from robot.api import logger
from robot.api.deco import keyword
from robot.libraries.BuiltIn import BuiltIn
from selenium import webdriver
from selenium.webdriver.firefox.firefox_binary import FirefoxBinary


class PreConfig:

    # insert choice of browsers in the list
    browsers = ['chrome']

    def __init__(self):
        pass

    @keyword("Get Environment URL")
    def initialise_automation_url(self):
        env = BuiltIn().get_variable_value("${ENVIRONMENT}")
        logger.info("env : " + env)
        if env == 'Stage':
            return 'https://marketplace.staging.myautochek.com/ng'

    @keyword("Get random browser")
    def get_random_browser(self):
        single_browser = random.choice(PreConfig.browsers)
        return single_browser

    def initialise_db_config(self):
        pass

