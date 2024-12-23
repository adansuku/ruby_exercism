# frozen_string_literal: true

#
# LogLineParser class
class LogLineParser
  def initialize(line)
    @line = line
  end

  attr_reader :line

  def message
    split_message[1].strip
  end

  def log_level
    split_message[0].gsub(/[^a-zA-Z]/, '').downcase.strip
  end

  def reformat
    message + " (#{log_level})"
  end

  private

  def split_message
    line.split(':')
  end
end
