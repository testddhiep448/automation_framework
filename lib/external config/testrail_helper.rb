require_relative './testrail_config'
class TestrailHelper

  def self.add_test_result_in_test_plan(example, plan_id, browserstack_page = nil)
    testrail_config = TestrailConfig.new
    testrail_api = testrail_config.api

    case_id = Integer(example.full_description.match(/C\d+/).to_s.downcase.delete('c'))
    runs_ids = get_runs_ids_for_case(testrail_api, plan_id, case_id)
    if runs_ids.empty?
      #MainLogger.logger.error  "#{example} is not part of the plan with id: #{plan_id}"
      #MainLogger.logger.error  "Check: #{testrail_config.plan_base_url}#{plan_id}"
    else
      runs_ids.each do |run_id|
        add_test_result_in_test_run(testrail_api, example, run_id, browserstack_page)
        test_id = get_test_id_from_test_run(testrail_api, case_id, run_id)
        #MainLogger.logger.info  "Added into TestRail run: #{run_id} the result of C#{case_id} into: T#{test_id}"
        #MainLogger.logger.info  "More details: #{testrail_config.test_case_base_url}#{test_id}"
      end
    end
  end

  def self.send_test_result(testrail_api, run_id, case_id, status_id = 1, comment = 'Passed')
    testrail_api.send_post("add_result_for_case/#{run_id}/#{case_id}", status_id: status_id, comment: comment)
  end

  def self.get_tests(testrail_api, run_id)
    testrail_api.send_get("get_tests/#{run_id}")
  end

  def self.get_test_plan(testrail_api, plan_id)
    testrail_api.send_get("get_plan/#{plan_id}")
  end

  def self.add_test_result_in_test_run(testrail_api, example, run_id, browserstack_page = nil)
    case_id = Integer(example.full_description.match(/C\d+/).to_s.downcase.delete('c'), 10)

    comment = browserstack_page.nil? ? '' : "Browserstack result page
              \n========\n #{browserstack_page}\n\n"

    if example.metadata[:pending]
      #Skip pending tests - Leave them as untested in Testrail
    else
      example.exception.nil? ?
          send_test_result(testrail_api, run_id, case_id, 1, comment) :
          send_test_result(testrail_api, run_id, case_id, 5, comment + "Exception\n========\n" + example.exception.to_s)
    end
  end

  def self.get_test_id_from_test_run(testrail_api, case_id, run_id)
    test_list = get_tests(testrail_api, run_id)
    test_case = test_list.find { |test|  test['case_id'] == case_id }
    test_case.fetch('id', nil)
  end

  def self.get_runs_ids(testrail_api, plan_id)
    test_plan_entries = get_test_plan(testrail_api, plan_id)['entries']
    test_plan_entries.map { |entry| entry['runs'][0]['id'] }
  end

  def self.get_runs_ids_for_case(testrail_api, plan_id, case_id)
    runs_ids_in_plan = get_runs_ids(testrail_api, plan_id)
    runs_ids_in_plan.select { |run_id| case_in_run?(testrail_api, case_id, run_id) }
  end

  def self.case_in_run?(testrail_api, case_id, run_id)
    test_list = get_tests(testrail_api, run_id)
    test_list.any? { |test_case| test_case['case_id'] == case_id }
  end
end
