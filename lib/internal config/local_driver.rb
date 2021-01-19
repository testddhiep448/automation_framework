require 'webdrivers'

class LocalDriver

  def init_driver(_driver_config, browser_name, _test_name, headless_run)
    browser_options = BrowserOptions.options(browser_name)
    browser_options = BrowserOptions.add_headless_chrome_option(browser_options) if headless_run && browser_name.to_s == 'chrome'

    Selenium::WebDriver.for browser_name, options: browser_options
  end
end
