# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'csv'

#generate a defined number of AHJ/State pairs

ahj_csv_text = File.read(Rails.root.join('lib', 'seeds', 'all_ahjs.csv'))
ahj_csv = CSV.parse(ahj_csv_text, :headers => true, :encoding => 'ISO-8859-1')
office_csv_text = File.read(Rails.root.join('lib', 'seeds', 'all_offices.csv'))
office_csv = CSV.parse(office_csv_text, :headers => true, :encoding => 'ISO-8859-1')

# make each row a hash element in a new array for the ahjs
ahj_list = []
ahj_csv.each do |row|
  ahj = row.to_hash
  ahj_list << ahj
end

# randomly select 10 ahjs from the above array of ~15000 ahjs and display their name and state
state_array = []
ahj_sample_list = ahj_list.sample(10)
ahj_sample_list.each do |ahj|
  state_array << ahj["State"]
  # p " AHJ: #{ahj["AHJ"]} STATE: #{ahj["State"]} "
end

#generate all offices that exist in the above states 

office_list = []
office_csv.each do |row|
  # p row["Name"]
  # p row["LocationCode"][0..1]
  office = row.to_hash
  office_list << office
end

#reduce array to only contain offices that exist in the states from the state_array

local_offices = office_list.select{|office| state_array.include?(office["LocationCode"][0..1])}
# local_offices.each do |office|
#    p "#{office["Name"]}, #{office["LocationCode"][0..1]}"
# end
# verification = local_offices.uniq{|office| office["LocationCode"][0..1]}
# p verification






