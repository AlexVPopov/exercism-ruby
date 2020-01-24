# frozen_string_literal

class CollatzConjecture
  def self.steps(n, step_count = 0)
    case n
    when ->(n) { !n.positive? } then raise(ArgumentError)
    when 1 then step_count
    when ->(n) { n.odd? } then steps(3 * n + 1, step_count + 1)
    else
      steps(n / 2, step_count + 1)
    end
  end
end
