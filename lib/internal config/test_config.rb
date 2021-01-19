class TestConfig
  def self.environment
    test_env = ENV['test_environment']
    case test_env
      when 'dev'
        :dev
      when 'uat'
        :uat
      else
        :dev
    end
  end

  def self.test_hub
    hub = ENV['hub']
    case hub
    when 'browserstack'
      :browserstack
    else
      :local
    end
  end

  def self.test_driver
    hub = ENV['hub']
    case hub
    when 'browserstack'
      BrowserstackDriver
    else
      LocalDriver
    end
  end

  def self.browser_name
    test_browser = ENV['test_browser'].to_s
    case test_browser
      when 'chrome'
        :chrome
      when 'firefox'
        :firefox
      when 'ie'
        :ie
      when 'safari'
        :safari
      when 'edge'
        :edge
      else
        :chrome
    end
  end

  def self.test_rail?
    test_rail = ENV['use_test_rail']

    (!test_rail.nil? && (test_rail == 'yes'))
  end

  def self.use_screenshot?
    ENV['use_screenshot'] == 'yes'
  end
end
