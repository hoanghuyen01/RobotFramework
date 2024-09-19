from robot.api.deco import library, keyword
from WebDriverManagerLibrary import WebDriverManagerLibrary
from SeleniumLibrary import SeleniumLibrary


@library
class CustomSeleniumLibrary:
    def __init__(self):
        self.seleniumLib = SeleniumLibrary()
        self.driver_manager = WebDriverManagerLibrary()

    @keyword
    def open_chrome_browser_with_manager(self, url):
        driver = self.driver_manager.get_chrome_driver()
        self.seleniumLib.register_driver(driver, "chrome")
        self.seleniumLib.go_to(url)

    @keyword
    def open_firefox_browser_with_manager(self, url):
        driver = self.driver_manager.get_firefox_driver()
        self.seleniumLib.register_driver(driver, "firefox")
        self.seleniumLib.go_to(url)
