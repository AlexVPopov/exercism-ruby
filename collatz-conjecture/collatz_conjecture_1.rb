# frozen_string_literal

class CollatzConjecture
  def self.steps(n, step_count)
    n.positive? ? find_steps_for(n, 0) : raise(ArgumentError)
  end

  def self.find_steps_for(n, steps_count)
    if n == 1
      steps_count
    elsif n.odd?
      find_steps_for(3 * n + 1, steps_count + 1)
    else
      find_steps_for(n / 2, steps_count + 1)
    end
  end

  private_class_method :find_steps_for
end
