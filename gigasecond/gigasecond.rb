
# frozen_string_literal: true

class Gigasecond
  GIGASECOND = 10**9

  def self.from(date)
    date + GIGASECOND
  end
end
