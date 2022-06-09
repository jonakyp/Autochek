from robot.api import logger
from robot.api.deco import keyword
from selenium.webdriver.firefox import webdriver
from webdriver_manager.chrome import ChromeDriverManager
from webdriver_manager.firefox import GeckoDriverManager
from webdriver_manager.microsoft import EdgeChromiumDriverManager


class DriverManager:
    def __init__(self):
        pass

    @keyword("Get Chrome driver Path")
    def get_chromedriver_path(self, version=None):
        if version is None:
            driver_path = ChromeDriverManager().install()
        else:
            driver_path = ChromeDriverManager(version=version).install()

        logger.info("Driver path " + driver_path)
        return driver_path

    @keyword("Get firefox driver path")
    def get_firefoxdriver_path(self):
        driver_path = GeckoDriverManager().install()
        return driver_path

    @keyword("Get edge driver path")
    def get_edge_driver_path(self):
        driver_path = EdgeChromiumDriverManager().install()
        return driver_path

    @keyword("Create firefox profile")
    def create_firefox_profile(self):
        profile = webdriver.FirefoxProfile()
        profile.set_preference('browser.download.folderList', 2)
        profile.set_preference('browser.download.manager.showWhenStarting', False)
        profile.set_preference('browser.helperApps.neverAsk.saveToDisk', '*/*')
        profile.set_preference('general.warnOnAboutConfig', False)
        return profile.path
