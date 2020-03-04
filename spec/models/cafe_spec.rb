require 'rails_helper'

describe Cafe, type: :model do
  describe 'validations' do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:address) }
    it { should validate_presence_of(:post_code) }
    it { should validate_presence_of(:number_of_chairs) }
    it { should validate_presence_of(:category) }
  end

    describe 'methods' do
    it 'it sorts cafes by post codes and list number of cafes and chairs in each' do
      cafe1 = Cafe.new(name: 'All Bar One', address: '27 East Parade', post_code: 'LS1 5BN', number_of_chairs: 20)
      cafe2 = Cafe.new(name: 'All Bar Two', address: '28 East Parade', post_code: 'AS1 5BN', number_of_chairs: 10)
      cafe3 = Cafe.new(name: 'All Bar Three', address: '29 East Parade', post_code: 'AS1 5BN', number_of_chairs: 40)

      post_codes = Cafe.post_codes

      expect(post_codes).to eq([{'LS1 5BN': 1, number_of_chairs: 20}, {'AS1 5BN': 2, number_of_chairs: 50}])
    end
  end
end
