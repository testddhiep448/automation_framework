class BrowserstackDriver

  def init_driver(driver_config, browser_name, test_name, headless_run)
    capabilities = common_capabilities(test_name)
    browser_name = capabilities['browser'] || browser_name.to_s

    case browser_name.downcase
      when 'chrome'
        caps = chrome_capabilities
        caps['chromeOptions']['args'] << '--headless' if headless_run

        @driver = Selenium::WebDriver.for(:remote,
                                          url: driver_config.hub_location,
                                          desired_capabilities: caps.merge!(capabilities))
      else
        @driver = Selenium::WebDriver.for(:remote,
                                          url: driver_config.hub_location,
                                          desired_capabilities: capabilities)
    end

    @driver.file_detector = lambda do |args|
      str = args.first.to_s
      str if File.exist?(str)
    end

    @driver
  end

  private
  def common_capabilities(test_name)
    caps = Selenium::WebDriver::Remote::Capabilities.new

    caps['project'] = ENV.fetch('bs_project', 'VDC_test')
    caps['build'] = "#{ENV.fetch('bs_build', '666')} Git branch: #{ENV.fetch('bs_branch', 'No branch')}"
    caps['name'] = test_name || ENV.fetch('bs_name', 'No test name')
    caps['browser'] = ENV.fetch('bs_browser', 'Chrome')
    caps['browser_version'] = ENV.fetch('bs_browser_version', '81.0')
    caps['os'] = ENV.fetch('bs_os', 'Windows')
    caps['os_version'] = ENV.fetch('bs_os_version', '10')
    caps['resolution'] = ENV.fetch('bs_resolution', '1920x1080')
    caps['acceptSslCerts'] = true
    caps['browserstack.networkLogs'] = ENV.fetch('bs_network_logs', true)
    caps['browserstack.debug'] = ENV.fetch('bs_debug', true)
    caps['browserstack.video'] = ENV.fetch('bs_video', true)
    caps['browserstack.timezone'] = 'GMT + 7'
    caps['browserstack.geckodriver'] = ENV.fetch('bs_gecko_driver', '0.24.0')
    caps['browserstack.chrome.driver'] = '2.43'
    caps['javascriptEnabled'] = true
    caps['cssSelectorsEnabled'] = true

    caps
  end

  def chrome_capabilities
    caps = Selenium::WebDriver::Remote::Capabilities.chrome
    caps['chromeOptions'] = {}
    caps['chromeOptions']['args'] = %w[--disable-plugins
                                       --ignore-certificate-errors
                                       --disable-popup-blocking
                                       --disable-translate
                                       --disable-infobars
                                       --enable-strict-powerful-feature-restrictions
                                       --disable-geolocation']
    caps
  end

end
