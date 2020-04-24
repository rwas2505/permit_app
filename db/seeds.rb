# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'csv'

#generate a defined number of AHJ/State pairs

csv_text = File.read(Rails.root.join('lib', 'seeds', 'all_ahjs.csv'))

csv = CSV.parse(csv_text, :headers => true, :encoding => 'ISO-8859-1')

# make each row a hash element in a new array
ahj_list = []
csv.each do |row|
  ahj = row.to_hash
  ahj_list << ahj
end

# randomly select 10 ahjs from the above array of ~15000 ahjs and display their name and state
sample_list = ahj_list.sample(10)
sample_list.each do |ahj|
  p " AHJ: #{ahj["AHJ"]} STATE: #{ahj["State"]} "
end
p sample_list.count

#generate a defined number of offices based on the states populated from the AHJs above


