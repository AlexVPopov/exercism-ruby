# frozen_string_literal: true

require 'pry'

class School
  def initialize
    @students = Hash.new { [] }
  end

  def add(student, grade)
    @students[grade] = @students[grade].push(student)
  end

  def students(grade)
    @students[grade].sort
  end

  def students_by_grade
    @students.map { |grade, students| { grade: grade, students: students.sort } }
             .sort_by { |group| group[:grade] }
  end
end
