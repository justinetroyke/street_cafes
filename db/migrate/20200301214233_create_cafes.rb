class CreateCafes < ActiveRecord::Migration[5.1]
  def change
    create_table :cafes do |t|
      t.string :name
      t.string :address
      t.string :post_code
      t.integer :number_of_chairs
    end
  end
end
