class BrowserOptions

  def self.options(browser_name)
    case browser_name
    when :chrome
      BrowserOptions.chrome_options
    when :safari
      BrowserOptions.safari_options
    when :firefox
      BrowserOptions.firefox_options
    when :ie
      BrowserOptions.ie_options
    when :edge
      BrowserOptions.edge_options
    else
      BrowserOptions.chrome_options
    end
  end

  def self.chrome_options
    options = Selenium::WebDriver::Chrome::Options.new
    options.add_argument('--ignore-certificate-errors')
    options.add_argument('--disable-popup-blocking')
    options.add_argument('--disable-translate')
    options.add_argument('--disable-plugins')
    options.add_argument('--disable-infobars')
    options.add_argument('--disable-automation')
    options.add_argument('--enable-strict-powerful-feature-restrictions')
    options.add_argument('--disable-geolocation')
    options.add_argument('--start-maximized')
    # options.add_argument('--enable-logging')
    options
  end

  def self.add_headless_chrome_option(options)
    options.add_argument('--headless')
    options
  end

  def self.firefox_options
    Selenium::WebDriver::Firefox::Options.new
  end

  def self.ie_options
    Selenium::WebDriver::IE::Options.new
  end

  def self.edge_options
    nil
  end

  def self.safari_options
    nil
  end
end
