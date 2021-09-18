# frozen_string_literal: true

module UrlDecorator
  def link_to_show
    link_to visit_url(short_url), url_path(short_url)
  end

  def link_to_original_url
    link_to truncate(original_url), original_url
  end

  def created_date
    l(created_at, format: '%b %d, %Y')
  end
end
