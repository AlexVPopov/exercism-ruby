# frozen_string_literal

class SpaceAge
  SECONDS_IN_YEAR = 365.25 * 24 * 60 * 60

  ORBITAL_PERIODS = { mercury: 0.2408467,
                      venus: 0.61519726,
                      earth: 1,
                      mars: 1.8808158,
                      jupiter: 11.862615,
                      saturn: 29.447498,
                      uranus: 84.016846,
                      neptune: 164.79132 }.freeze

  AGE_METHOD_NAME = /on_(#{ORBITAL_PERIODS.keys.join('|')})/.freeze

  def initialize(seconds)
    @seconds = seconds
  end

  def method_missing(name, *args, &block)
    return super unless name =~ AGE_METHOD_NAME

    planet = Regexp.last_match(1).to_sym

    (seconds / (ORBITAL_PERIODS[planet] * SECONDS_IN_YEAR)).round(2)
  end

  def respond_to_missing?(name, include_private = false)
    name =~ AGE_METHOD_NAME || super
  end

  private

  attr_reader :seconds
end
