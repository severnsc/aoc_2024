require "test_helper"

class Aoc2024::Guard::PatrolTest < Minitest::Test
  def setup
    @guard = Aoc2024::Guard.new
  end

  def test_one_tile_room
    room = ["^"]

    assert_equal ["X"], @guard.patrol(room)
  end

  def test_exiting_room
    room = [".", "^"]

    assert_equal %w[X X], @guard.patrol(room)
  end

  def test_encountering_obstacle
    room = ["#.", "^."]

    assert_equal ["#.", "XX"], @guard.patrol(room)
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
      %w[
        ....#.....
        ....XXXXX#
        ....X...X.
        ..#.X...X.
        ..XXXXX#X.
        ..X.X.X.X.
        .#XXXXXXX.
        .XXXXXXX#.
        #XXXXXXX..
        ......#X..
      ], @guard.patrol(room)
    )
  end
end
