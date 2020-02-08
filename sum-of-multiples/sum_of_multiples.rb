# frozen_string_literal: true

class SumOfMultiples
  def initialize(*bases)
    @bases = bases - [0]
  end

  def to(limit)
    bases.flat_map { |base| (base...limit).step(base).to_a }.uniq.sum
  end

  private

  attr_reader :bases
end
