# frozen_string_literal: true

# Handles tournament results and formatting
class Tournament
  HEADER_TEMPLATE = '%<team>-31s| %<mp>2s | %<wins>2s | %<draws>2s | %<losses>2s | %<points>2s'
  HEADER = format(HEADER_TEMPLATE, team: 'Team', mp: 'MP', wins: 'W', draws: 'D', losses: 'L', points: 'P')

  ROW_TEMPLATE = '%<team>-31s| %<matches_played>2i | %<wins>2i | %<draws>2i | %<losses>2i | %<points>2i'
  DEFAULT_STATS = { matches_played: 0, wins: 0, draws: 0, losses: 0, points: 0 }.freeze

  def self.tally(input)
    return "#{HEADER}\n" if input.strip.empty?

    results = process_results(input)
    formatted_rows = order_and_format_rows(results)

    "#{HEADER}\n#{formatted_rows.join("\n")}\n"
  end

  class << self
    ACTIONS = {
      win: :handle_win,
      loss: :handle_loss,
      draw: :handle_draw
    }.freeze

    private

    # Processes the input and computes team statistics
    def process_results(input)
      results = Hash.new { |hash, key| hash[key] = DEFAULT_STATS.dup }

      input.lines.each do |line|
        team1, team2, result = line.strip.split(';')

        results[team1][:matches_played] += 1
        results[team2][:matches_played] += 1

        update_results(results, team1, team2, result)
      end

      results
    end

    # Updates the statistics of the teams based on the match result
    def update_results(results, team1, team2, result)
      send(ACTIONS[result.to_sym], results, team1, team2)
    end

    # Handle the "win" case
    def handle_win(results, team1, team2)
      results[team1][:wins] += 1
      results[team2][:losses] += 1
      results[team1][:points] += 3
    end

    # Handle the "loos" case
    def handle_loss(results, team1, team2)
      results[team2][:wins] += 1
      results[team1][:losses] += 1
      results[team2][:points] += 3
    end

    # Handle the "draw" case
    def handle_draw(results, team1, team2)
      results[team1][:draws] += 1
      results[team2][:draws] += 1
      results[team1][:points] += 1
      results[team2][:points] += 1
    end

    # Formats the rows of the tournament table
    def order_and_format_rows(results)
      results
        .sort_by { |team, stats| [-stats[:points], team] }
        .map { |team, stats| format_row(team, stats) }
    end

    # Formats a single row for the output
    def format_row(team, stats)
      format(ROW_TEMPLATE, team: team, matches_played: stats[:matches_played], wins: stats[:wins], draws: stats[:draws],
                           losses: stats[:losses], points: stats[:points])
    end
  end
end
