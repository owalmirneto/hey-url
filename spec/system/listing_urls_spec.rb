# frozen_string_literal: true

require 'webdrivers'

describe 'Listing Urls' do
  before { driven_by :selenium, using: :headless_chrome }

  describe 'index' do
    before do
      latest_urls
      visit root_path
    end

    let(:latest_urls) { create_list(:url, 10) }
    let(:last_url) { create(:url) }

    it 'shows a list of short urls' do
      expect(page).to have_text('HeyURL!')
    end

    it 'shows page title' do
      expect(page)
        .to have_selector('.card-title', text: 'Create a new short URL')
    end

    it 'have a field to create short urls ' do
      expect(page).to have_field('url[original_url]')
    end

    it 'have no link for last url' do
      expect(page).not_to have_link(href: url_path(last_url.short_url))
    end

    it 'have link for latest urls' do
      latest_urls.map do |url|
        expect(page).to have_link(href: url_path(url.short_url))
      end
    end
  end
end
