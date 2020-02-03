# frozen_string_literal

class Garden
  PLANTS = %i(clover grass radishes violets).freeze

  PLANT_MAPPING = Hash[PLANTS.map { |plant| plant.to_s[0].upcase }.zip(PLANTS)]

  STUDENTS = %i(alice bob charlie david eve fred
                ginny harriet ileana joseph kincaid larry).freeze

  def initialize(diagram, students = STUDENTS)
    @students = students.sort.map { |student| student.downcase.to_sym }

    @cups = diagram.split("\n").map { |row| row.scan(/../) }.transpose.map(&:join)
  end

  def method_missing(name)
    return super unless students.include?(name)

    cups[students.index(name)].chars.map { |char| PLANT_MAPPING[char] }
  end

  def respond_to_missing?(name, include_private = false)
    students.include?(name) || super
  end

  private

  attr_reader :cups, :students
end
