class TestrailConfig
  
  TEST_RAIL_URL = 'https://vdctestdoduchiep.testrail.io/'.freeze
  TEST_RAIL_USER = 'vdc.test.ddh@gmail.com'.freeze
  TEST_RAIL_KEY = 'fcdhJqvhP3b8ijautbdQ-Q5Woe/ihVPu55lBL3NAl'.freeze
  TEST_CASE_BASE_URL = "#{TEST_RAIL_URL}/index.php?/tests/view/".freeze
  CASE_BASE_URL = "#{TEST_RAIL_URL}/index.php?/cases/view/".freeze
  TEST_PLAN_BASE_URL = "#{TEST_RAIL_URL}/index.php?/plans/view/".freeze
  TEST_RUN_BASE_URL = "#{TEST_RAIL_URL}/index.php?/runs/view/".freeze

  def initialize
    @testrail_api = TestRail::APIClient.new(TEST_RAIL_URL)
    @testrail_api.user = TEST_RAIL_USER
    @testrail_api.password = TEST_RAIL_KEY
  end

  def case_base_url
    CASE_BASE_URL
  end

  def test_case_base_url
    TEST_CASE_BASE_URL
  end

  def plan_base_url
    TEST_PLAN_BASE_URL
  end

  def run_base_url
    TEST_RUN_BASE_URL
  end

  def api
    @testrail_api
  end
end
