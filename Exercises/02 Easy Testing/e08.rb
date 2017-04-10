require 'minitest/autorun'

class TypeTest < MiniTest::Test
  def setup
    @value = 3
  end

  def test_type
    assert_kind_of(Numeric, @value)
  end
end
