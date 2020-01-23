# frozen_string_literal: true

class Sieve
  def initialize(limit)
    @limit = limit
  end

  def primes
    return [] if limit < 2

    sieve = [1, 1, *Array.new(limit - 1, 0)]

    filter(sieve, [])
  end

  private

  attr_reader :limit

  def filter(sieve, primes)
    prime = sieve.index(0)

    primes.push(prime)

    prime.step(by: prime).take_while { |index| sieve[index] = 1 if index <= limit }

    sieve.none?(&:zero?) ? primes : filter(sieve, primes)
  end
end
