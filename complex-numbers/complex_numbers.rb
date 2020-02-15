# frozen_string_literal: true

require 'bigdecimal'

class ComplexNumber
  attr_reader :real, :imaginary

  def initialize(real, imaginary)
    @real = real.to_f
    @imaginary = imaginary.to_f
  end

  def ==(other)
    real == other.real && imaginary == other.imaginary
  end

  def +(other)
    self.class.new(real + other.real, imaginary + other.imaginary)
  end

  def -(other)
    self.class.new(real - other.real, imaginary - other.imaginary)
  end

  def *(other)
    self.class.new(((real * other.real) - (imaginary * other.imaginary)),
                   (imaginary * other.real + real * other.imaginary))
  end

  def /(other)
    self.class
        .new((real * other.real + imaginary * other.imaginary) /
             (other.real ** 2 + other.imaginary ** 2),
             (imaginary * other.real - real * other.imaginary) /
             (other.real ** 2 + other.imaginary ** 2))
  end

  def abs
    Math.sqrt(real ** 2 + imaginary ** 2)
  end

  def conjugate
    self.class.new(real, -imaginary)
  end

  def exp
    self.class.new(Math.exp(real) * Math.cos(imaginary),
                   Math.exp(real) * Math.sin(imaginary).round(10))
  end
end
