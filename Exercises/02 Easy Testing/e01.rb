require 'minitest/autorun'

class ValueTest < MiniTest::Test
  def setup
    @value = 2
  end

  def test_odd
    assert @value.odd?, 'value is not odd'
  end
end
