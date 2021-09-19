# frozen_string_literal: true

class UrlSerializer < ApplicationSerializer
  attributes :id, :created_at, :original_url
  attribute :shortened_url, key: :url
  attribute :clicks_count, key: :clicks

  has_many :clicks
end
