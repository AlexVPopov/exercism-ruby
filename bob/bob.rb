# frozen_string_literal

class Bob
  QUESTION           = ->(remark) { remark.end_with? '?' }
  SCREAMING          = ->(remark) { remark.match(/[a-zA-Z]/) && remark == remark.upcase }
  SCREAMING_QUESTION = ->(remark) { QUESTION.call(remark) && SCREAMING.call(remark) }
  NO_REMARK          = ->(remark) { remark.empty? }

  def self.hey(remark)
    case remark.strip
    when NO_REMARK then 'Fine. Be that way!'
    when SCREAMING_QUESTION then 'Calm down, I know what I\'m doing!'
    when QUESTION then 'Sure.'
    when SCREAMING then 'Whoa, chill out!'
    else
      'Whatever.'
    end
  end
end
