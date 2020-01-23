# frozen_string_literal: true

class Sieve
  def initialize(limit)
    @limit = limit
  end

  def primes
    return [] if limit < 2

    sieve = (2..limit).to_a

    sieve.reduce(sieve) { |sieve, x| sieve.reject { |y| y > x && (y % x).zero? } }
  end

  private

  attr_reader :limit
end
