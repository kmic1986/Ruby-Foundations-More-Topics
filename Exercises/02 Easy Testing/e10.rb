require 'minitest/autorun'

class TypeTest < MiniTest::Test
  def setup
    @list = ['abc', 'lmn', 'xyz']
  end

  def test_type
    refute_includes(@list, 'xyz')
  end
end
