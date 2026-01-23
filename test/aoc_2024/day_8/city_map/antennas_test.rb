require "test_helper"

class CityMap::AntennasTest < Minitest::Test
  def test_no_antennas
    city_map = CityMap.new "."

    assert_empty city_map.antennas
  end

  def test_one_antenna
    city_map = CityMap.new "a"

    assert_equal [Antenna.new(x: 0, y: 0, frequency: "a")], city_map.antennas
  end

  def test_many_antennas
    city_map = CityMap.new ".a.\n.ba"

    assert_equal(
      [
        Antenna.new(x: 1, y: 0, frequency: "b"),
        Antenna.new(x: 2, y: 0, frequency: "a"),
        Antenna.new(x: 1, y: 1, frequency: "a")
      ],
      city_map.antennas
    )
  end
end
