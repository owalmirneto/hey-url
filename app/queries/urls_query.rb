# frozen_string_literal: true

class UrlsQuery < ApplicationQuery
  def initialize
    super

    @relation = Url.all
  end

  def latest
    @relation = relation.order(:created_at).limit(10)
  end
end
