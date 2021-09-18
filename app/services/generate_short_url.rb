# frozen_string_literal: true

class GenerateShortUrl
  def self.call(size = 5)
    new(size).perform
  end

  def initialize(size)
    @size = size
  end

  def perform
    size.times.map { |_| ('A'..'Z').to_a.sample }.join
  end

  private

  attr_reader :size
end
