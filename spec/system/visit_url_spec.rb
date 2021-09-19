# frozen_string_literal: true

require 'webdrivers'

describe 'Visit original url' do
  before { driven_by :selenium, using: :headless_chrome }

  describe 'visit' do
    before { visit visit_path(url.short_url) }

    let(:url) { create(:url) }

    xit 'redirects the user to the original url' do
      expect(page.current_url).to eq(url.original_url)
    end

    context 'when not found' do
      let(:url) { build(:url) }

      it 'shows a 404 page' do
        expect(page).to have_content('Page not found :(')
      end
    end
  end
end
