# frozen_string_literal: true

class UrlValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    return if value.present? && valid_url?(value)

    record.errors.add(attribute, :invalid)
  end

  private

  def valid_url?(value)
    URI.parse(value)
  rescue URI::InvalidURIError
    false
  end
end
