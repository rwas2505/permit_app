# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'csv'

ahj_csv_text = File.read(Rails.root.join('lib', 'seeds', 'all_ahjs.csv'))
ahj_csv = CSV.parse(ahj_csv_text, :headers => true, :encoding => 'ISO-8859-1')

office_csv_text = File.read(Rails.root.join('lib', 'seeds', 'all_offices.csv'))
office_csv = CSV.parse(office_csv_text, :headers => true, :encoding => 'ISO-8859-1')

category_csv_text = File.read(Rails.root.join('lib', 'seeds', 'categories.csv'))
category_csv = CSV.parse(category_csv_text, :headers => true, :encoding => 'ISO-8859-1')

#generate a defined number of AHJ/State pairs

# make each row a hash element in a new array for the ahjs
ahj_list = []
ahj_csv.each do |row|
  ahj = row.to_hash
  ahj_list << ahj
end

# randomly select 10 ahjs from the above array of ~15000 ahjs and display their name and state
state_array = []
ahj_sample_list = ahj_list.sample(100)
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

#reduce office_list to only contain offices that exist in the states from the state_array
local_offices = office_list.select{|office| state_array.include?(office["LocationCode"][0..1])}
# local_offices.each do |office|
#    p "#{office["Name"]}, #{office["LocationCode"][0..1]}"
# end
# verification = local_offices.uniq{|office| office["LocationCode"][0..1]; office["LocationCode"][0..1]}
# pp verification

#create category and sub category list
category_list = []
category_csv.each do |row|
  category = row.to_hash
  category_list << category
end

#product_list
product_list = [
  "Solar Roof", 
  "Powerwall", 
  "Flat Plate"
]

# boolean_list
boolean_list = [true, false]

#level_reviewed
level_reviewed = [
  "When submitting, AHJ would NOT allow submittal", 
  "Submitted successfully, received rejection", 
  "Online submittal method required additional info that was not available",
]

rejection_source = [
  "New AHJ Requirement",	
  "Unique Requirement",	
  "Unknown Source",	
  "Incorrect AHJ Assigned",	
  "Conditional AHJ Approval",	
  "PIDM Review", 
  "As Built Does Not Match Approved Plans"
]

5.times do
  ahj_object = ahj_sample_list.sample
  ahj = ahj_object["AHJ"]
  state = ahj_object["State"]
  office_instances = local_offices.select{|office| state == office["LocationCode"][0..1]}
  if office_instances == []
    office = "Certified Installer"
  else
    office = office_instances.sample
  end
  p "ahj: #{ahj}"
  p "state: #{state}"
  p "office: #{office}"
end



# category (category_list)
# sub_category (category_list)
# product (product_list)
# office  (local_offices)
# state   (ahj_sample_list)
# ahj     (ahj_sample_list)
# level_reviewed (level_reviewed)
# rejection_source (rejection_source)

#TODO
#generate seed data based on lists populated in this file

# corrections_uploaded (true or false, generate randomly)
# note    ("")
# case    (increment each time through loop, start with some arbitrary number)
# installation (increment each time through loop, start with some arbitrary number)





