require_relative '../../spec/spec_helper'

describe 'HAPPY test case for OpenWeatherMap', :OpenWeatherMap_HAPPY do
###################################################################################################
  let(:test_data) {EnvironmentConfig.instance.data}
  let(:test_url) {test_data[:openweathermap][:url]}
  let(:search_keyword){"Ho Chi Minh city"}
  let(:search_result){"Thanh pho Ho Chi Minh"}
###################################################################################################
  it "[C1] Search weather in your city" do
    TestRunContent.test_step("Navigate to #{test_url}")
      home_page = OpenWheaterMap.new(@browser, test_url)
        .wait_to_load

    TestRunContent.test_step("Verify that Search box is displayed")
      expected_displayed = true
      actual_displayed = home_page.check_search_form_displayed?
      verify_expected_actual(expected_displayed, actual_displayed)

    TestRunContent.test_step("Search for keyword '#{search_keyword}'")
      home_page.search_keyword(search_keyword)
      result_page = OWM_Result.new(@browser)
        .wait_to_load

    TestRunContent.test_step("Verify search result")
      expected_search = true
      actual_search = result_page.check_result(search_result)
      verify_expected_actual(expected_search, actual_search)
  end
end
