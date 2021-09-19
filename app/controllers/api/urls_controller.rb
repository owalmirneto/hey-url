# frozen_string_literal: true

module API
  class UrlsController < ApplicationController
    before_action :set_urls, only: :index
    before_action :set_url, only: %i[show visit]

    def index
      render json: @urls
    end

    private

    def set_urls
      @urls = UrlsQuery.new.latest
    end
  end
end
