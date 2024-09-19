from webdriver_manager.chrome import ChromeDriverManager
from webdriver_manager.firefox import GeckoDriverManager
from selenium import webdriver


class WebDriverManagerLibrary:
    def get_chrome_driver(self):
        ChromeDriverManager().install()
        return webdriver.Chrome()

    def get_firefox_driver(self):
        GeckoDriverManager().install()
        return webdriver.Firefox()
