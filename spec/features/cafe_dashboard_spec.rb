require 'rails_helper'

  RSpec.feature "Cafe view", type: :feature do
    describe 'A visitor' do
      context 'visiting the cafe view path' do
        it 'should have the view according to #4 specs' do

          visit "/cafes"

          expect(page).to have_content('post_code')
          expect(page).to have_content('total_places')
          expect(page).to have_content('total_chairs')
          expect(page).to have_content('chairs_pct')
          expect(page).to have_content('place_with_max_chairs')
        end
      end

      context 'the cafe shown through postal code stats' do
        it 'show number of places, chairs and max chair for postal codes' do
          cafe1 = Cafe.new(name: 'All Bar One', address: '27 East Parade', post_code: 'LS1 5BN', number_of_chairs: 20)
          cafe2 = Cafe.new(name: 'All Bar Two', address: '28 East Parade', post_code: 'LS1 5BN', number_of_chairs: 10)
          cafe3 = Cafe.new(name: 'All Bar Three', address: '29 East Parade', post_code: 'AS1 5BN', number_of_chairs: 40)
          cafe4 = Cafe.new(name: 'All Bar Four', address: '30 East Parade', post_code: 'AS1 5BN', number_of_chairs: 40)
          cafe5 = Cafe.new(name: 'All Bar Five', address: '31 East Parade', post_code: 'BS1 5BN', number_of_chairs: 15)
          cafe6 = Cafe.new(name: 'All Bar Six', address: '32 East Parade', post_code: 'BS1 5BN', number_of_chairs: 10)
          cafe7 = Cafe.new(name: 'All Bar Seven', address: '33 East Parade', post_code: 'CS1 5BN', number_of_chairs: 15)

          visit "/cafes"

          expect(page).to have_content('LS1 5BN')
          expect(page).to have_content('AS1 5BN')
          expect(page).to have_content('BS1 5BN')
          expect(page).to have_content('CS1 5BN')

          expect(page).to have_content(2)
          expect(page).to have_content(2)
          expect(page).to have_content(2)
          expect(page).to have_content(1)

          expect(page).to have_content(30)
          expect(page).to have_content(80)
          expect(page).to have_content(25)
          expect(page).to have_content(15)
        end
      end
    end
  end
  # post_code: The Post Code
  # total_places: The number of places in that Post Code
  # total_chairs: The total number of chairs in that Post Code
  # chairs_pct: Out of all the chairs at all the Post Codes, what percentage does this Post Code represent (should sum to 100% in the whole view)
  # place_with_max_chairs: The name of the place with the most chairs in that Post Code -max_chairs: The number of chairs at the place_with_max_chairs
