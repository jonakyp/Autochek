"""Necessary configurations to be done before testrun"""
import random
from robot.api import logger
from robot.api.deco import keyword
from robot.libraries.BuiltIn import BuiltIn


class PreConfig:
    """Necessary configurations to be done before testrun"""
    # insert choice of browsers in the list
    browsers = ['chrome']

    def __init__(self):
        pass

    @keyword("Get Environment URL")
    def initialise_automation_url(self):
        """Select Enviroment and URL to be used in testrun"""
        env = BuiltIn().get_variable_value("${ENVIRONMENT}")
        logger.info("env : " + env)
        if env == 'Stage':
            return 'https://marketplace.staging.myautochek.com/ng'
        return None

    @keyword("Get random browser")
    def get_random_browser(self):
        """Randomly select the browser to used in the testrun"""
        single_browser = random.choice(PreConfig.browsers)
        return single_browser
