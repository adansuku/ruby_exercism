require 'minitest/autorun'
require_relative 'isbn_verifier'

class IsbnVerifierTest < Minitest::Test
  def test_valid_isbn
    string = "3-598-21508-8"
    assert IsbnVerifier.valid?(string), "Expected true, '#{string}' is a valid isbn"
  end

  def test_invalid_isbn_check_digit
    string = "3-598-21508-9"
    refute IsbnVerifier.valid?(string), "Expected false, '#{string}' is not a valid isbn"
  end

  def test_valid_isbn_with_a_check_digit_of_10
    string = "3-598-21507-X"
    assert IsbnVerifier.valid?(string), "Expected true, '#{string}' is a valid isbn"
  end

  def test_check_digit_is_a_character_other_than_x
    string = "3-598-21507-A"
    refute IsbnVerifier.valid?(string), "Expected false, '#{string}' is not a valid isbn"
  end

  def test_invalid_check_digit_in_isbn_is_not_treated_as_zero
    string = "4-598-21507-B"
    refute IsbnVerifier.valid?(string), "Expected false, '#{string}' is not a valid isbn"
  end

  def test_invalid_character_in_isbn_is_not_treated_as_zero
    string = "3-598-P1581-X"
    refute IsbnVerifier.valid?(string), "Expected false, '#{string}' is not a valid isbn"
  end

  def test_x_is_only_valid_as_a_check_digit
    string = "3-598-2X507-9"
    refute IsbnVerifier.valid?(string), "Expected false, '#{string}' is not a valid isbn"
  end

  def test_valid_isbn_without_separating_dashes
    string = "3598215088"
    assert IsbnVerifier.valid?(string), "Expected true, '#{string}' is a valid isbn"
  end

  def test_isbn_without_separating_dashes_and_x_as_check_digit
    string = "359821507X"
    assert IsbnVerifier.valid?(string), "Expected true, '#{string}' is a valid isbn"
  end

  def test_isbn_without_check_digit_and_dashes

    string = "359821507"
    refute IsbnVerifier.valid?(string), "Expected false, '#{string}' is not a valid isbn"
  end

  def test_too_long_isbn_and_no_dashes

    string = "3598215078X"
    refute IsbnVerifier.valid?(string), "Expected false, '#{string}' is not a valid isbn"
  end

  def test_too_short_isbn

    string = "00"
    refute IsbnVerifier.valid?(string), "Expected false, '#{string}' is not a valid isbn"
  end

  def test_isbn_without_check_digit

    string = "3-598-21507"
    refute IsbnVerifier.valid?(string), "Expected false, '#{string}' is not a valid isbn"
  end

  def test_check_digit_of_x_should_not_be_used_for_0

    string = "3-598-21515-X"
    refute IsbnVerifier.valid?(string), "Expected false, '#{string}' is not a valid isbn"
  end

  def test_empty_isbn

    string = ""
    refute IsbnVerifier.valid?(string), "Expected false, '#{string}' is not a valid isbn"
  end

  def test_input_is_9_characters

    string = "134456729"
    refute IsbnVerifier.valid?(string), "Expected false, '#{string}' is not a valid isbn"
  end

  def test_invalid_characters_are_not_ignored_after_checking_length

    string = "3132P34035"
    refute IsbnVerifier.valid?(string), "Expected false, '#{string}' is not a valid isbn"
  end

  def test_invalid_characters_are_not_ignored_before_checking_length

    string = "3598P215088"
    refute IsbnVerifier.valid?(string), "Expected false, '#{string}' is not a valid isbn"
  end

  def test_input_is_too_long_but_contains_a_valid_isbn

    string = "98245726788"
    refute IsbnVerifier.valid?(string), "Expected false, '#{string}' is not a valid isbn"
  end
end
