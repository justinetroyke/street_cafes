class Cafe < ApplicationRecord
  validates_presence_of :name,
                        :address,
                        :post_code,
                        :number_of_chairs
end
