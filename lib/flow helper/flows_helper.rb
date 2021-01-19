require 'wait_until'
require 'selenium-webdriver'

def wait_for(timeout = 30)
  Selenium::WebDriver::Wait.new(
    timeout: timeout,
    ignore: [
      Selenium::WebDriver::Error::NoSuchElementError,
      NoMethodError,
      Selenium::WebDriver::Error::StaleElementReferenceError,
      Selenium::WebDriver::Error::UnknownError,
      Selenium::WebDriver::Error::JavascriptError
    ]
  ).until { yield }
end