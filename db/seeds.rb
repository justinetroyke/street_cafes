# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'csv'

csv_text = File.read(Rails.root.join('db', 'seeds', 'Street_Cafes_2015_16.csv'))
csv = CSV.parse(csv_text, :headers => true, :encoding => 'ISO-8859-1')
csv.each do |row|
  t = Cafe.new
  t.name = row['Cafe/Restaurant Name']
  t.address = row['Street Address']
  t.post_code = row['Post Code']
  t.number_of_chairs = row['Number of Chairs']
  t.save
  puts "#{t.name}, #{t.address} saved"
end

puts "There are now #{Model.count} rows in the cafes table"
