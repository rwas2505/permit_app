# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


######## Note, this is the originl seeds file to generate 500 rejections for app version 1.0 ########

require 'csv'

ahj_csv_text = File.read(Rails.root.join('lib', 'seeds', 'all_ahjs.csv'))
ahj_csv = CSV.parse(ahj_csv_text, :headers => true, :encoding => 'ISO-8859-1')

office_csv_text = File.read(Rails.root.join('lib', 'seeds', 'all_offices.csv'))
office_csv = CSV.parse(office_csv_text, :headers => true, :encoding => 'ISO-8859-1')

category_csv_text = File.read(Rails.root.join('lib', 'seeds', 'categories.csv'))
category_csv = CSV.parse(category_csv_text, :headers => true, :encoding => 'ISO-8859-1')

# make each row a hash element in a new array for the ahjs
ahj_list = []
ahj_csv.each do |row|
  ahj = row.to_hash
  ahj_list << ahj
end

# randomly select quantity of ahjs from the above array of ~15000 ahjs
state_array = []
ahj_sample_list = ahj_list.sample(50)
ahj_sample_list.each do |ahj|
  state_array << ahj["State"]
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

#create category_list to call category and sub_category
category_list = []
category_csv.each do |row|
  category = row.to_hash
  category_list << category
end

product_list = [
  "Solar Roof", 
  "Powerwall", 
  "Flat Plate"
]

boolean_list = [true, false]

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

3.times do 
  rejection_number = rand(1..2)
  category_object = category_list.sample
  category = category_object["category"]
  sub_category = category_object["sub_category"]
  ahj_object = ahj_sample_list.sample
  state = ahj_object["State"]
  office_instances = local_offices.select{|office| state == office["LocationCode"][0..1]}
  if office_instances == []
    office = "Certified Installer"
  else
    office = office_instances.sample["Name"]
  end
  
  job = Job.new(
    installation_id: rand(134888...999999),
    job_number: rand(134888...999999),
    state: state,
    ahj: ahj_object["AHJ"],
    office: office
  )
  job.save

  rejection1 = Rejection.new(
    product: product_list.sample,
    level_reviewed: level_reviewed.sample,
    rejection_source: rejection_source.sample,
    corrections_uploaded: boolean_list.sample,
    job_id: job.id
  ) 
  rejection1.save
  
  cat1 = Category.new(
    name: category,
    rejection_id: rejection1.id
  )
  cat1.save
  
  subcategory1 = Subcategory.new(
    name: sub_category,
    category_id: cat1.id
  )
  subcategory1.save
  
  note1 = Note.new(
    text: Faker::Lorem.sentence(word_count: 7) ,
    subcategory_id: subcategory1.id
  )
  note1.save
  
  if rejection_number > 1
    rejection2 = Rejection.new(
      product: product_list.sample,
      level_reviewed: level_reviewed.sample,
      rejection_source: rejection_source.sample,
      corrections_uploaded: boolean_list.sample,
      job_id: job.id
    ) 
    rejection2.save
    
    cat2 = Category.new(
      name: category,
      rejection_id: rejection2.id
    )
    cat2.save
    
    subcategory2 = Subcategory.new(
      name: sub_category,
      category_id: cat2.id
    )
    subcategory2.save

    note2 = Note.new(
      text: Faker::Lorem.sentence(word_count: 7) ,
      subcategory_id: subcategory2.id
    )
    note2.save
  end
end
  