# frozen_string_literal: true

class TrackClick
  def self.call(*args)
    new(*args).perform
  end

  def initialize(url, browser)
    @url = url
    @browser = browser
  end

  def perform
    url.clicks.create(click_params)
  end

  private

  attr_reader :url, :browser

  def click_params
    { browser: browser.name, platform: browser.platform.name }
  end
end
