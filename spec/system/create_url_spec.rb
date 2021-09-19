# frozen_string_literal: true

require 'webdrivers'

# WebDrivers Gem
# https://github.com/titusfortner/webdrivers
#
# Official Guides about System Testing
# https://api.rubyonrails.org/v5.2/classes/ActionDispatch/SystemTestCase.html

describe 'Short Urls' do
  before { driven_by :selenium, using: :headless_chrome }

  describe 'create' do
    before { visit root_path }

    let(:url) { build(:url) }

    before do
      fill_in 'url_original_url',	with: url.original_url

      click_on('Shorten URL')
    end

    let(:created_url) { Url.find_by(original_url: url.original_url) }

    context 'when url is valid' do
      it 'creates the short url' do
        expect(created_url).to be_present
      end

      it 'redirects to the home page' do
        expect(page).to have_current_path(root_path)
      end
    end

    context 'when url is invalid' do
      let(:url) { build(:invalid_url) }

      it 'does not create the short url and shows a message' do
        expect(created_url).to be_nil
      end

      it 'redirects to the home page' do
        expect(page).to have_current_path(urls_path)
      end
    end
  end
end
