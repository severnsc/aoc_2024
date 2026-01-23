class CityMap
  def initialize(map)
    self.map = map
  end

  def antennas
    @antennas ||= find_antennas
  end

  def antenna_frequencies
    map_chars = map.chars.uniq
    map_chars.delete "."
    map_chars
  end

  def antinodes
    return [] unless antennas.length > 1

    antinodes = Set.new
    antenna_pairs.each do |first, second|
      pair_antinodes = first.antinodes_with second
      pair_antinodes.each { |antinode| antinodes.add antinode }
    end
    antinodes.to_a.filter do |antinode|
      antinode.within_boundaries? map_boundaries
    end
  end

  private

  def antenna_frequency_regex
    Regexp.new "[#{antenna_frequencies.join("")}]"
  end

  def antenna_groups
    antenna_frequencies.map do |frequency|
      antennas.filter { |antenna| antenna.frequency == frequency }
    end
  end

  def antenna_pairs
    antenna_groups.flat_map do |antenna_group|
      antenna_group.combination(2).to_a
    end
  end

  def find_antennas
    return [] if antenna_frequencies.empty?

    antennas = []
    map.lines.map(&:chomp).reverse.each_with_index do |line, line_index|
      searching = true
      offset = 0
      while searching
        antenna_index = line.index antenna_frequency_regex, offset
        if antenna_index
          antennas << Antenna.new(x: antenna_index, y: line_index, frequency: line[antenna_index])
          offset = antenna_index.next
        else
          searching = false
        end
      end
    end
    antennas
  end

  def map_boundaries
    { x: 0...map.lines.first.chomp.length, y: 0...map.lines.length }
  end

  attr_accessor :map
end
