require 'minitest/autorun'
require 'microwave_numbers'

class TestGenerateKeypressesForSeconds < MiniTest::Unit::TestCase
  def test_0
    assert_equal ['0*'], generate_keypresses_for_seconds(0)
  end

  def test_60
    assert_equal ['60*', '100*'], generate_keypresses_for_seconds(60)
  end

  def test_71
    assert_equal ['71*', '111*'], generate_keypresses_for_seconds(71)
  end
end


class TestCalculateTravelDistance < MiniTest::Unit::TestCase
  def test_111
    assert_equal 0, calculate_travel_distance('')
  end

  def test_111
    assert_equal 0, calculate_travel_distance('111')
  end

  def test_123
    assert_equal 2, calculate_travel_distance('123')
  end

  def test_bogus
    assert_raises UnknownKey do
      calculate_travel_distance('1a')
    end
  end
end


class TestMicrowaveNumbers < MiniTest::Unit::TestCase
  def test_0
    assert_equal '0*', microwave(0)
  end
end
