require 'rails_helper'

  RSpec.feature "Cafe view", type: :feature do
    describe 'A visitor' do
      context 'visiting the cafe view path' do
        it 'should have the view according to #4 specs' do

          visit cafe_dashboard_path

          expect(page).to have_content('post_code')
          expect(page).to have_content('total_places')
          expect(page).to have_content('total_chairs')
          expect(page).to have_content('chairs_pct')
          expect(page).to have_content('place_with_max_chairs')
        end
      end
    end
  end
  # post_code: The Post Code
  # total_places: The number of places in that Post Code
  # total_chairs: The total number of chairs in that Post Code
  # chairs_pct: Out of all the chairs at all the Post Codes, what percentage does this Post Code represent (should sum to 100% in the whole view)
  # place_with_max_chairs: The name of the place with the most chairs in that Post Code -max_chairs: The number of chairs at the place_with_max_chairs
