require 'retryable'

class Page
  attr_accessor :browser

  def initialize(browser)
    @browser = browser
  end

  def self.navigate_to(browser, page_url)
    page = new(browser)
    @browser.navigate.to(page_url)
    page
  end

  def wait_to_element_display(condition, should_retry = true, retry_count = 3)
    if should_retry
      retry_block_condition(retry_count) { wait_for { condition } }
    else
      wait_for { condition }
    end
    self
  end

  def wait_to_load()
    wait_to_element_display(load_condition)
    TestRunContent.print_content("Open new page successfully")
    self
  end

  def retry_block_condition(retry_count)
    Retryable.retryable(tries: retry_count, exception_cb: on_exception ) do
      yield
    end
  end

  def on_exception
    proc do |exception|
      puts exception
      # MainLogger.logger.info exception
      browser.navigate.refresh
    end
  end

  def load_condition
    raise NotImplementedError, 'load_condition'
  end

  def check_element_display(element)
    result = true
    begin
      element.displayed?
    rescue
      result = false
    else
      result = true
    end
    return result
  end

end
