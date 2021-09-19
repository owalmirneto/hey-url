# frozen_string_literal: true

class Url < ApplicationRecord
  has_many :clicks

  validates :original_url, url: true
  validates :short_url, uniqueness: true

  before_create :set_short_url

  private

  def set_short_url
    loop do
      self.short_url = GenerateShortUrl.call

      break if self.class.where(short_url: short_url)
    end
  end
end
