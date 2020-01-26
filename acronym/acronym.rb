# frozen_string_literal: true

class Acronym
  # version 1

  def self.abbreviate(str)
    str.split(/\W/).map(&:chr).join.upcase
  end

  # version 2

  # def self.abbreviate(str)
  #   str.scan(/\b\w/).join.upcase
  # end
end
