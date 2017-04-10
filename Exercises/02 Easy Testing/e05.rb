require 'minitest/autorun'

class ValueTest < MiniTest::Test
  def setup
    @list = ['abc', 'lmn', 'wxyz']
  end

  def test_included
    assert_includes(@list, 'xyz')
  end
end
