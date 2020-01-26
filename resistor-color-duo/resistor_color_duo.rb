# frozen_string_literal: true

class ResistorColorDuo
  COLORS = %w(black brown red orange yellow green blue violet grey white).freeze

  def self.value(colors)
    colors.take(2).map(&COLORS.method(:index)).join.to_i
  end
end
