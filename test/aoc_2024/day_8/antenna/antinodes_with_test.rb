require "test_helper"

class Antenna::AntinodesWithTest < Minitest::Test
  def test_antennas_with_difference_frequencies
    assert_empty Antenna.new(x: 0, y: 0, frequency: "a").antinodes_with Antenna.new(x: 1, y: 1, frequency: "b")
  end

  def test_antennas_with_same_frequency
    first = Antenna.new x: 5, y: 9, frequency: "0"
    second = Antenna.new x: 8, y: 10, frequency: "0"

    assert_equal [Antinode.new(x: 11, y: 11), Antinode.new(x: 2, y: 8)], first.antinodes_with(second)
  end
end
