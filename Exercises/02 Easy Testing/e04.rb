require 'minitest/autorun'

class ValueTest < MiniTest::Test
  def setup
    @list = [1, 2, 3]
  end

  def test_empty
    assert_empty @list
  end
end
