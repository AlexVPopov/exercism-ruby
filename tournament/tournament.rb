# frozen_string_literal: true

class Tournament
  def self.tally(input)
    new(input).tally
  end

  def initialize(input)
    @input = input
    @stats = Hash.new do |stats, team|
      stats[team] = { name: team, mp: 0, w: 0, d:0, l: 0, p: 0 }
    end
  end

  def tally
    table.join
  end

  private

  attr_reader :input, :stats

  def results
    @results ||=
      games.each_with_object(stats) do |(home_team, away_team, match_result), stats|
        case match_result
        when 'win'  then win(home_team, away_team)
        when 'loss' then win(away_team, home_team)
        else             draw(home_team, away_team)
        end
      end
  end

  def games
    input.split("\n").map { |game| game.split(';') }
  end

  def win(winner, loser)
    stats[winner][:mp] += 1
    stats[loser][:mp] += 1
    stats[winner][:w] += 1
    stats[winner][:p] += 3
    stats[loser][:l] += 1
  end

  def draw(first_team, second_team)
    stats[first_team][:mp] += 1
    stats[second_team][:mp] += 1
    stats[first_team][:d] += 1
    stats[first_team][:p] += 1
    stats[second_team][:d] += 1
    stats[second_team][:p] += 1
  end

  def table
    [header_row, *rows]
  end

  def header_row
    row('Team', 'MP', 'W', 'D', 'L', 'P')
  end

  def rows
    results.values
           .sort_by { |team| [-team[:p], -team[:name]] }
           .map { |team| row(*team.values) }
  end

  def row(first_cell, *rest_cells)
    [first_cell(first_cell), *rest_cells.map { |cell| cell(cell) }].join(' | ') + "\n"
  end

  def first_cell(content)
    content.ljust(30)
  end

  def cell(content)
    content.to_s.rjust(2)
  end
end
