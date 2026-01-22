require "test_helper"

class Aoc2024::Guard::LoopPostionsForTest < Minitest::Test
  def setup
    @guard = Aoc2024::Guard.new
  end

  def test_no_loops
    room = ["^"]

    assert_empty @guard.loop_positions_for(room)
  end

  def test_one_loop_position
    room = %w[
      .#.
      #^.
      .#.
    ]

    assert_equal [[1, 2]], @guard.loop_positions_for(room)
  end

  def test_two_loop_positions
    room = %w[
      .#...
      .....
      #^...
      .#.#.
    ]

    assert_equal [[1, 2], [1, 4]], @guard.loop_positions_for(room)
  end

  def test_aoc_example
    room = %w[
      ....#.....
      .........#
      ..........
      ..#.......
      .......#..
      ..........
      .#..^.....
      ........#.
      #.........
      ......#...
    ]

    assert_equal(
      [[6, 3], [7, 6], [7, 7], [8, 1], [8, 3], [9, 7]],
      @guard.loop_positions_for(room)
    )
  end
end
