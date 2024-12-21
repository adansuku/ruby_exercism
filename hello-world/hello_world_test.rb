# frozen_string_literal: true

require 'minitest/autorun'
require_relative 'hello_world'

# Class for testing HelloWorld
class HelloWorldTest < Minitest::Test
  def test_say_hi
    assert_equal 'Hello, World!', HelloWorld.hello
  end
end
