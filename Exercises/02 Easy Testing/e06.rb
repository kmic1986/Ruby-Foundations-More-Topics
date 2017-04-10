require 'minitest/autorun'

class ValueTest < MiniTest::Test
  def error_test
    assert_raises NoExperienceError do
      employee.hire
    end
  end
end
