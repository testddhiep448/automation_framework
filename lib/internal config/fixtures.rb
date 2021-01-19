class Fixtures
  class Setup
    def self.init_driver(test_hub, headless_run, test_name = nil)
      driver_config = Object.const_get("#{test_hub.to_s.capitalize}Config").new
      test_driver = Object.const_get("#{test_hub.to_s.capitalize}Driver").new

      browser = Browser.new(driver_config, test_driver, test_name)

      browser_name = TestConfig.test_hub == :browserstack ? nil : TestConfig.browser_name

      driver = browser.init_driver(browser_name, headless_run)

      raise Selenium::WebDriver::Error::WebDriverError, 'Could not create browser object' if driver.nil?

      driver.manage.window.maximize
      driver
    end
  end

  class Teardown
    def self.close(driver)
      driver&.quit
    end
  end
end
