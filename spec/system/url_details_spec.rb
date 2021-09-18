# frozen_string_literal: true

require 'webdrivers'

describe 'Listing Urls' do
  before { driven_by :selenium, using: :headless_chrome }

  describe 'show' do
    before { visit url_path(url.short_url) }

    let(:url) { create(:url) }

    it 'shows a panel of stats for a given short url' do
      expect(page).to have_content(url.original_url)
    end

    it 'shows created date short url' do
      expect(page).to have_content(url.created_at.strftime('%b %d, %Y'))
    end

    context 'when not found' do
      let(:url) { build(:url) }

      it 'shows a 404 page' do
        expect(page).to have_content('Page not found :(')
      end
    end
  end
end
