# frozen_string_literal: true

class PrimeFactors
  def self.of(n, prime_factors = [], primes = [2])
    return prime_factors if n < 2

    return of(n / primes.last, prime_factors.push(primes.last), primes) if (n % primes.last).zero?

    return of(n, prime_factors, primes.push(3)) if primes.last == 2

    next_prime = (primes.last+2..Math.sqrt(n).ceil).step(2).find do |prime_candidate|
      (primes.last+2..Math.sqrt(prime_candidate).ceil)
        .step(2)
        .none? { |divisor| (prime_candidate % divisor).zero? }
    end

    of(n, prime_factors, primes.push(next_prime || n))
  end
end
