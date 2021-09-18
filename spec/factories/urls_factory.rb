# frozen_string_literal: true

FactoryBot.define do
  factory :url do
    short_url { 'ABCDE' }
    sequence(:original_url) { |i| "#{Faker::Internet.url}/path-to-#{i}" }

    trait :invalid do
      short_url { nil }
      original_url { nil }
    end

    factory :invalid_url, traits: [:invalid]
  end
end
