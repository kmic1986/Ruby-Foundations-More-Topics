require 'minitest/autorun'

class TypeTest < MiniTest::Test
  def setup
    @list = 3
  end

  def test_type
    assert_same(@list, @list.process)
  end
end
