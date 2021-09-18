# frozen_string_literal: true

module UrlDecorator
  def link_to_visit
    link_to visit_url(short_url), visit_path(short_url)
  end

  def link_to_original_url
    link_to original_url, truncate(original_url)
  end

  def create_date
    l(created_at, format: '%b %d, %Y')
  end
end
