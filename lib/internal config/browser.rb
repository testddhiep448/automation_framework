class Browser
  attr_accessor :test_driver, :test_name, :driver_config, :driver

  def initialize(driver_config, test_driver, test_name)
    @test_driver = test_driver
    @test_name = test_name
    @driver_config = driver_config
    @driver = nil
  end

  def init_driver(browser_name, headless_run)
    @driver = @test_driver.init_driver(@driver_config, browser_name, @test_name, headless_run)
  end
end
