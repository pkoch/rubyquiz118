require 'minitest/autorun'
require 'microwave_numbers'

class TestMicrowaveNumbers < MiniTest::Unit::TestCase
  def test_0
    assert_equal 0, microwave(0)
  end
end
