require 'minitest/autorun'

class ValueTest < MiniTest::Test
  def setup
    @value = 'WXYZ'
  end

  def test_downcase
    assert_equal 'xyz', @value.downcase
  end
end
