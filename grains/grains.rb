# frozen_string_literal: true

class Grains
  def self.square(n)
    raise ArgumentError unless n.between?(1, 64)

    2 ** (n - 1)
  end

  def self.total(n = 64)
    2 ** n - 1
  end
end
