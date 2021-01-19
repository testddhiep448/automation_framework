require 'rest-client'
require_relative './browserstack_config'

class BrowserstackHelper
  def self.get_results_data(bs_session_id)
    browserstack = BrowserstackConfig.new

    response = RestClient.get "#{browserstack.api_endpoint}/sessions/#{bs_session_id}.json"
    response.body
  end

  def self.get_bs_url(bs_session_id)
    bs_response_body = get_results_data(bs_session_id)
    parsed_body = JSON.parse(bs_response_body, symbolize_names: true)
    parsed_body[:automation_session][:browser_url]
  end

  def self.fail_bs_status(bs_session_id)
    browserstack = BrowserstackConfig.new
    RestClient.put "#{browserstack.api_endpoint}/sessions/#{bs_session_id}.json",
                   { status: 'error' }.to_json, content_type: :'application/json'
  end
end
