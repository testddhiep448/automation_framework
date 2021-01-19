require 'rspec'
require 'require_all'
require 'dotenv'
require 'yaml'

require_all 'lib'

RSpec.configure do |config|
  config.example_status_persistence_file_path = 'status_file.txt'

  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end

  Dotenv.load '.env'
  config.filter_run_excluding uat_exclusion: true if TestConfig.environment == :uat
  config.filter_run_excluding dev_exclusion: true if TestConfig.environment == :pro

  config.before(:all) do
    Dotenv.load '.env'
    EnvironmentConfig.instance.read_data(TestConfig.environment)
  end

  config.before(:each) do |example|
    test_name = example.metadata[:description]
    headless_run = false
    headless_run = example.metadata[:headless_run] if example.metadata.key?(:headless_run)
    TestRunContent.start_testcase(test_name)
    @browser = Fixtures::Setup.init_driver(TestConfig.test_hub, headless_run, test_name)
  end

  config.after(:each) do |example|
    TestRunContent.clear_test_step
    test_name = example.metadata[:description]
    TestRunContent.end_testcase(test_name)
    #MainLogger.logger.info "Finished: #{example.metadata[:description]}"

    bs_result_page = nil
    if TestConfig.test_hub == :browserstack
      #MainLogger.logger.info 'Test ran on browserstack'

      bs_result_page = BrowserstackHelper.get_bs_url(@browser.session_id)
      #MainLogger.logger.info "Browserstack result page: #{bs_result_page}"

      BrowserstackHelper.fail_bs_status(@browser.session_id) unless example.exception.nil?
    else
      #MainLogger.logger.info 'Test ran on local machine'
    end

    if !example.exception.nil? && TestConfig.use_screenshot?
      @browser.save_screenshot "./#{Time.now.strftime("failshot__%d_%m_%Y__%H_%M_%S")}.png"
    end

    TestrailHelper.add_test_result_in_test_plan(example, ENV['test_plan_id'], bs_result_page) if TestConfig.test_rail?

  ensure
    Fixtures::Teardown.close(@browser)
  end


end
