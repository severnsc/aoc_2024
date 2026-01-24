module DayEight
  require_relative "day_8/antenna"
  require_relative "day_8/antinode"
  require_relative "day_8/city_map"

  def self.solve_part_one
    input = File.read File.expand_path "day_8/input.txt", File.dirname(__FILE__)
    city_map = CityMap.new input
    p city_map.antinodes.count
  end

  def self.solve_part_two
    input = File.read File.expand_path "day_8/input.txt", File.dirname(__FILE__)
    city_map = CityMap.new input
    p city_map.harmonic_antinodes.count
  end
end
