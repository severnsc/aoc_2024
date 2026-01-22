require "test_helper"

class BridgeRepair::CalibrationResultTest < Minitest::Test
  def setup
    @bridge_repair = BridgeRepair.new
    @bridge_repair.operators = ["+", "*"]
  end

  def test_singe_operand_equals_result
    assert_equal 1, @bridge_repair.calibration_result([[1, [1]]])
  end

  def test_single_operand_does_not_equal_result
    assert_equal 0, @bridge_repair.calibration_result([[1, [0]]])
  end

  def test_two_operands_sum_together
    assert_equal 2, @bridge_repair.calibration_result([[2, [1, 1]]])
  end

  def test_two_operands_multiply_together
    assert_equal 1, @bridge_repair.calibration_result([[1, [1, 1]]])
  end

  def test_three_operands_with_mixed_operators
    assert_equal 9, @bridge_repair.calibration_result([[9, [1, 2, 3]]])
  end

  def test_aoc_example
    input = [
      [190, [10, 19]],
      [3267, [81, 40, 27]],
      [83, [17, 5]],
      [156, [15, 6]],
      [7290, [6, 8, 6, 15]],
      [161_011, [16, 10, 13]],
      [192, [17, 8, 14]],
      [21_037, [9, 7, 18, 13]],
      [292, [11, 6, 16, 20]]
    ]

    assert_equal 3749, @bridge_repair.calibration_result(input)
  end
end
