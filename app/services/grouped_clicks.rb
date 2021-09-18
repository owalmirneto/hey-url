# frozen_string_literal: true

class GroupedClicks
  def initialize(url)
    @clicks = url.clicks
  end

  def daily
    month_days.map { |day| [day.to_s, daily_clicks[day].to_i] }
  end

  def browsers
    group_clicks(:browser).to_a
  end

  def platform
    group_clicks(:platform).to_a
  end

  private

  attr_reader :clicks

  def daily_clicks
    @daily_clicks ||= group_clicks('EXTRACT(DAY FROM created_at)::integer')
  end

  def group_clicks(grouper)
    clicks.group(grouper).count.to_h
  end

  def month_days
    (1..Time.days_in_month(Date.current.month, Date.current.year)).to_a
  end
end
