class Cafe < ApplicationRecord
  validates_presence_of :name,
                        :address,
                        :post_code,
                        :number_of_chairs,
                        :category

  def self.post_codes
    all = Cafe.order("post_code")
    #Insert ActiveRecord and SQL here to do all the BI
  end
end
