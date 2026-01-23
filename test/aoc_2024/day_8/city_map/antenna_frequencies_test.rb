require "test_helper"

class CityMap::AntennaFrequenciesTest < Minitest::Test
  def test_no_frequencies
    city_map = CityMap.new "."

    assert_empty city_map.antenna_frequencies
  end

  def test_one_frequency
    city_map = CityMap.new "a"

    assert_equal ["a"], city_map.antenna_frequencies
  end

  def test_many_frequencies
    city_map = CityMap.new ".aAb0"

    assert_equal %w[a A b 0], city_map.antenna_frequencies
  end
end
