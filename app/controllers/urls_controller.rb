# frozen_string_literal: true

class UrlsController < ApplicationController
  before_action :set_urls, only: :index
  before_action :set_url, only: %i[show visit]

  def index
    @url = Url.new
  end

  def create
    @url = Url.new(url_params)

    if @url.save
      redirect_to root_path, notice: t('.successfully')
    else
      set_urls
      render :index
    end
  end

  def show
    @daily_clicks = grouper.daily
    @browsers_clicks = grouper.browsers
    @platform_clicks = grouper.platform
  end

  def visit
    TrackClick.call(@url, browser)

    redirect_to @url.original_url
  end

  private

  def url_params
    params.require(:url).permit(:original_url)
  end

  def query
    @query ||= UrlsQuery.new
  end

  def set_urls
    @urls = query.latest
  end

  def set_url
    @url = query.find_by!(short_url: params[:url])
  end

  def grouper
    @grouper ||= GroupedClicks.new(@url)
  end

  def browser
    @browser ||= Browser.new(request.headers['HTTP_USER_AGENT'])
  end
end
