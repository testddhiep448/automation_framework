class OpenWheaterMap < Page

  def initialize(browser, url = nil)
    super(browser)
    browser.navigate.to url unless url.nil?
  end

  def load_condition
    search_form[0].displayed?
  end

  # PAGE OJECTS ---------------------------------------------------- #
  def search_form
    browser.find_elements(:id, 'nav-search-form')
  end

  def search_result(input_keyword)
    browser.find_elements(:xpath, "//a[contains(text(), '#{input_keyword}')]")
  end

  # ACTIONS -------------------------------------------------------- #
  def check_search_form_displayed?
    check_element_display(search_form[0])
  end

  def search_keyword(keyword)
    browser.action
      .click(search_form[0])
      .send_keys(keyword)
      .send_keys(:enter)
      .perform
    true
  end
end
