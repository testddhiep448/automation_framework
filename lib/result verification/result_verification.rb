include RSpec

def verify_expected_actual(expected, actual)
    if expect(expected).to eq(actual)
        TestRunContent.verify_pass("Actual results and Expected results are matched")
    else
        TestRunContent.verify_error("Actual results and Expected results are NOT matched")
    end
end