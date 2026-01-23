require "test_helper"

class CityMap::AntinodesTest < Minitest::Test
  def test_no_antennas
    city_map = CityMap.new "."

    assert_empty city_map.antinodes
  end

  def test_one_antenna
    city_map = CityMap.new "a"

    assert_empty city_map.antinodes
  end

  def test_one_pair_of_antennas
    city_map = CityMap.new ".aa."

    assert_equal [Antinode.new(x: 3, y: 0), Antinode.new(x: 0, y: 0)], city_map.antinodes
  end

  def test_antinodes_outside_of_map_boundaries
    city_map = CityMap.new "a.a"

    assert_empty city_map.antinodes
  end

  def test_multiple_pairs_of_antennas
    city_map = CityMap.new ".aa.\n.bb."

    assert_equal(
      [
        Antinode.new(x: 3, y: 1),
        Antinode.new(x: 0, y: 1),
        Antinode.new(x: 3, y: 0),
        Antinode.new(x: 0, y: 0)
      ],
      city_map.antinodes
    )
  end

  def test_antenna_as_antinode
    city_map = CityMap.new "a.a.a"

    assert_equal(
      [
        Antinode.new(x: 4, y: 0),
        Antinode.new(x: 0, y: 0)
      ],
      city_map.antinodes
    )
  end
end
