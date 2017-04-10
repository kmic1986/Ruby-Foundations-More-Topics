require 'minitest/autorun'

class ValueTest < MiniTest::Test
  def setup
    @value = 2
  end

  def test_nil
    assert_nil @value
  end
end
