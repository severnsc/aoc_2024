class Aoc2024::Guard
  UP = "Up"
  DOWN = "Down"
  LEFT = "Left"
  RIGHT = "Right"

  def loop_positions_for(room)
    face_up
    find_starting_place_in room
    starting_position = current_position
    result = patrol room
    visited_positions = []
    result.each_with_index do |row, row_index|
      row.each_char.each_with_index do |char, col_index|
        visited_positions << [row_index, col_index] if char == "X"
      end
    end
    obstacle_cache = {}
    row_indicies = 0...room.length
    col_indicies = 0...room.first.length
    loop_positions = []
    visited_positions.each do |visited_position|
      face_up
      self.current_position = starting_position
      patrolling = true
      looping = false
      while patrolling && !looping
        next_space = "#" if next_position == visited_position && next_position != starting_position
        next_space ||= result[next_row][next_col] if row_indicies.include?(next_row) && col_indicies.include?(next_col)
        case next_space
        when "X", "."
          self.current_position = next_position
        when "#"
          obstacle_cache[next_position] ||= {}
          if obstacle_cache[next_position][facing]
            looping = true
          else
            obstacle_cache[next_position][facing] = 1
          end
          turn_right
        else
          patrolling = false
        end
        next_space = nil
      end
      loop_positions << visited_position if looping
      obstacle_cache = {}
    end
    loop_positions
  end

  def patrol(room)
    face_up
    find_starting_place_in room
    traversed = room.map { |row| row[0..] }
    traversed[current_row][current_col] = visited_marker
    row_indicies = 0...room.length
    col_indicies = 0...room.first.length
    patrolling = true
    while patrolling
      next_space = traversed[next_row][next_col] if row_indicies.include?(next_row) && col_indicies.include?(next_col)
      case next_space
      when "X", "."
        self.current_position = next_position
        traversed[current_row][current_col] = visited_marker
      when "#"
        turn_right
      else
        patrolling = false
      end
      next_space = nil
    end
    traversed
  end

  private

  attr_accessor :facing, :current_position

  def current_col
    current_position[1]
  end

  def current_position_marker
    "^"
  end

  def current_row
    current_position[0]
  end

  def face_up
    self.facing = UP
  end

  def find_starting_place_in(room)
    row_index = room.index { |row| row.include? current_position_marker }
    col_index = room[row_index].index current_position_marker
    self.current_position = [row_index, col_index]
  end

  def next_col
    next_position[1]
  end

  def next_row
    next_position[0]
  end

  def next_position
    case facing
    when UP
      [current_position[0] - 1, current_position[1]]
    when RIGHT
      [current_position[0], current_position[1] + 1]
    when DOWN
      [current_position[0] + 1, current_position[1]]
    when LEFT
      [current_position[0], current_position[1] - 1]
    end
  end

  def turn_right
    self.facing = case facing
                  when UP
                    RIGHT
                  when RIGHT
                    DOWN
                  when DOWN
                    LEFT
                  when LEFT
                    UP
                  end
  end

  def visited_marker
    "X"
  end
end
