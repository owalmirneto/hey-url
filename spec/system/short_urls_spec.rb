# frozen_string_literal: true

require 'webdrivers'

# WebDrivers Gem
# https://github.com/titusfortner/webdrivers
#
# Official Guides about System Testing
# https://api.rubyonrails.org/v5.2/classes/ActionDispatch/SystemTestCase.html

RSpec.describe 'Short Urls', type: :system do
  before do
    driven_by :selenium, using: :headless_chrome
    # If using Firefox
    # driven_by :selenium, using: :firefox
    #
    # If running on a virtual machine or similar that does not have a UI, use
    # a headless driver
    # driven_by :selenium, using: :headless_chrome
    # driven_by :selenium, using: :headless_firefox
  end

  describe 'index' do
    it 'shows a list of short urls' do
      visit root_path
      expect(page).to have_text('HeyURL!')
      # expect page to show 10 urls
    end
  end

  describe 'show' do
    it 'shows a panel of stats for a given short url' do
      visit url_path('ABCDE')
      # expect page to show the short url
    end

    context 'when not found' do
      it 'shows a 404 page' do
        visit url_path('NOTFOUND')
        # expect page to be a 404
      end
    end
  end

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

  describe 'visit' do
    it 'redirects the user to the original url' do
      visit visit_path('ABCDE')
      # add more expections
    end

    context 'when not found' do
      it 'shows a 404 page' do
        visit visit_path('NOTFOUND')
        # expect page to be a 404
      end
    end
  end
end
