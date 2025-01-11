class SimpleCalculator
  class UnsupportedOperation < StandardError; end

  ALLOWED_OPERATIONS = ['+', '/', '*'].freeze

  def self.calculate(first_operand, second_operand, operation)
    validate_operation(operation)
    validate_operands(first_operand, second_operand)

    # Check the zero division case
    return "Division by zero is not allowed." if operation == '/' && second_operand.zero?

    # Calculate the result
    perform_calculation(first_operand, second_operand, operation)
  end

  private

  def self.validate_operation(operation)
    unless ALLOWED_OPERATIONS.include?(operation)
      raise UnsupportedOperation, "The operation '#{operation}' is not supported."
    end
  end

  def self.validate_operands(first_operand, second_operand)
    unless first_operand.is_a?(Integer) && second_operand.is_a?(Integer)
      raise ArgumentError, 'Operands must be integers.'
    end
  end

  def self.perform_calculation(first_operand, second_operand, operation)
    calculator = {
      :+ => "#{first_operand} + #{second_operand} = #{first_operand + second_operand}",
      :/ => "#{first_operand} / #{second_operand} = #{first_operand / second_operand}",
      :* => "#{first_operand} * #{second_operand} = #{first_operand * second_operand}"
    }

    calculator[operation.to_sym]
  end
end
