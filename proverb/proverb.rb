# frozen_string_literal

class Proverb
  def initialize(*wants, qualifier: '')
    @wants = wants
    @initial_want = "#{qualifier} #{wants.first}".strip
  end

  def to_s
    wants
      .each_cons(2)
      .map { |want, price| "For want of a #{want} the #{price} was lost." }
      .push("And all for the want of a #{initial_want}.")
      .join("\n")
  end

  private

  attr_reader :wants, :initial_want
end
