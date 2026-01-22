class BridgeRepair
  attr_accessor :operators

  ADD = ->(x) { ->(y) { x + y } }
  MULTIPLY = ->(x) { ->(y) { x * y } }

  def calibration_result(test_values)
    test_values.filter do |test_value, operands|
      equations = []
      operator_permutations = operators.repeated_permutation(operands.length - 1).to_a
      operator_permutations.each do |permutation|
        permutation_index = 0
        equation = []
        operands.each do |operand|
          equation << operand
          equation << permutation[permutation_index] if permutation_index < permutation.length
          permutation_index += 1
        end
        equations << equation
      end
      results = equations.map { |eq| evaluate eq }
      results.include? test_value
    end.sum(&:first)
  end

  private

  def evaluate(equation)
    operand = nil
    method = nil
    equation.each do |term|
      case term
      when "+"
        method = ADD.call(operand)
      when "*"
        method = MULTIPLY.call(operand)
      else
        operand = term if operand.nil?
        if method
          operand = method.call(term)
          method = nil
        end
      end
    end
    operand
  end
end
