# frozen_string_literal: true

require 'byebug'

# Handles tournament results and formatting
class Tournament
  HEADER_TEMPLATE = '%<team>-31s| %<mp>2s | %<wins>2s | %<draws>2s | %<losses>2s | %<points>2s'
  HEADER = format(HEADER_TEMPLATE, team: 'Team', mp: 'MP', wins: 'W', draws: 'D', losses: 'L', points: 'P')
  ROW_TEMPLATE = '%<team>-31s| %<matches_played>2i | %<wins>2i | %<draws>2i | %<losses>2i | %<points>2i'
  DEFAULT_STATS = { matches_played: 0, wins: 0, draws: 0, losses: 0, points: 0 }.freeze

  def self.tally(input)
    return HEADER if input.strip.empty?

    results = process_results(input)

    formatted_rows = format_rows(results)
    "#{HEADER}#{formatted_rows.join("\n")}\n"
  end

  # Processes the input and computes team statistics
  def self.process_results(input)
    results = Hash.new { |hash, key| hash[key] = DEFAULT_STATS.dup }

    input.lines.each do |line|
      team1, team2, result = line.strip.split(';')

      results[team1][:matches_played] += 1
      results[team2][:matches_played] += 1

      update_results(results, team1, team2, result)
    end

    results
  end

  ACTIONS = {
    'win' => ->(results, team1, team2) { handle_win(results, team1, team2) },
    'loss' => ->(results, team1, team2) { handle_loss(results, team1, team2) },
    'draw' => ->(results, team1, team2) { handle_draw(results, team1, team2) }
  }.freeze

  # Updates the statistics of the teams based on the match result
  def self.update_results(results, team1, team2, result)
    ACTIONS[result].call(results, team1, team2)
  end

  # Handle the "win" case
  def self.handle_win(results, winner, loser)
    results[winner][:wins] += 1
    results[loser][:losses] += 1
    results[winner][:points] += 3
  end

  # Handle the "loss" case
  def self.handle_loss(results, loser, winner)
    handle_win(results, winner, loser) # Reuse logic for win
  end

  # Handle the "draw" case
  def self.handle_draw(results, team1, team2)
    results[team1][:draws] += 1
    results[team2][:draws] += 1
    results[team1][:points] += 1
    results[team2][:points] += 1
  end

  # Formats the rows of the tournament table
  def self.format_rows(results)
    results
      .sort_by { |team, stats| [-stats[:points], team] }
      .map { |team, stats| format_row(team, stats) }
  end

  # Formats a single row for the output
  def self.format_row(team, stats)
    format(ROW_TEMPLATE, team: team.to_s, matches_played: stats[:matches_played], wins: stats[:wins],
                         draws: stats[:draws], losses: stats[:losses], points: stats[:points])
  end
end
