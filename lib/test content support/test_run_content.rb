
class TestRunContent
  $test_step = 0

  def self.test_step(content)
    $test_step += 1
    puts "\n   \e[44m[STEP #{$test_step}]: #{content}\e[0m"
  end

  def self.print_content(content)
    puts "      \e[36m#{content}\e[0m"
  end

  def self.start_testcase(content)
    puts "\n\e[45m [#{Time.now.strftime('%Y-%m-%d %H:%M:%S')}] START TEST CASE '#{content}'\e[0m"
  end

  def self.end_testcase(content)
    puts "\n\e[45m [#{Time.now.strftime('%Y-%m-%d %H:%M:%S')}] END TEST CASE '#{content}'\e[0m"
  end

  def self.verify_pass(content)
    puts "      \e[32m[RESULT STEP#{$test_step}] #{content}\e[0m"
  end

  def self.verify_error(content)
    raise StandardError, "[UNEXPECTED RESULT STEP#{$test_step}] #{content}"
  end

  def self.clear_test_step
    $test_step = 0
  end
end