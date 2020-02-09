# frozen_string_literal: true

class ETL
  # version 1

  # def self.transform(data)
  #   Hash[data.flat_map { |score, letters| letters.map(&:downcase).product([score]) }]
  # end

  # version 2

  def self.transform(data)
    data.each_with_object({}) do |(score, letters), transformed|
      letters.each { |letter| transformed[letter.downcase] = score }
    end
  end
end
