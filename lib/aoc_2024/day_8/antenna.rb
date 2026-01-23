require_relative "point"

class Antenna < Point
  include ActiveModel::Model

  attr_accessor :frequency

  def antinodes_with(antenna)
    return [] unless frequency == antenna.frequency

    x_distance = x_distance_from antenna
    y_distance = y_distance_from antenna
    slope = slope_with antenna

    other_first_x = x_distance - antenna.x * -1
    other_second_x = -x_distance - antenna.x * -1
    other_first_y = y_distance - antenna.y * -1
    other_second_y = -y_distance - antenna.y * -1
    possible_antinodes = [
      Antinode.new(x: other_first_x, y: other_first_y),
      Antinode.new(x: other_first_x, y: other_second_y),
      Antinode.new(x: other_second_x, y: other_first_y),
      Antinode.new(x: other_second_x, y: other_second_y)
    ]
    first_antinode_index = possible_antinodes.index do |antinode|
      antinode.coordinates != coordinates && slope_with(antinode) == slope
    end
    first_antinode = possible_antinodes[first_antinode_index]

    first_x = x_distance - x * -1
    second_x = -x_distance - x * -1
    first_y = y_distance - y * -1
    second_y = -y_distance - y * -1
    possible_antinodes = [
      Antinode.new(x: first_x, y: first_y),
      Antinode.new(x: first_x, y: second_y),
      Antinode.new(x: second_x, y: first_y),
      Antinode.new(x: second_x, y: second_y)
    ]
    second_antinode_index = possible_antinodes.index do |antinode|
      antinode.coordinates != antenna.coordinates && slope_with(antinode) == slope
    end
    second_antinode = possible_antinodes[second_antinode_index]
    [first_antinode, second_antinode]
  end
end
