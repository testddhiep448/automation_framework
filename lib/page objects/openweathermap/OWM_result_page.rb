class OWM_Result < Page

  def initialize(browser, url = nil)
    super(browser)
    browser.navigate.to url unless url.nil?
  end

  def load_condition
    weather_in_your_city.displayed?
  end

  # PAGE OJECTS ---------------------------------------------------- #
  def weather_in_your_city
    browser.find_element(:xpath, "//h2[contains(text(), 'Weather in your city')]")
  end

  def search_result(input_keyword)
    browser.find_element(:xpath, "//a[contains(text(), '#{input_keyword}')]")
  end

  # ACTIONS -------------------------------------------------------- #
  def check_result(keyword)
    check_element_display(search_result(keyword))
    # delay for BrowserStack video capturing
    sleep 2
    true
  end
end
