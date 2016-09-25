# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

drug_list = [
              "Lisinopril",
              "Simvastatin",
              "Metformin",
              "alendronate",
              "Tamsulosin" ,
              "Levothyroxine",
              "Sertraline",
              "Hydrochlorothiazide",
              "Metoprolol",
              "Isosorbide mononitrate"
            ]


User.create(
  name: 'Vivian',
  insurance_plan_number: "111111",
  insurance_type: "Medicare Plan D",
  insurance_name: "Aetna",
  cost_per_month_before_gap: 500, 
  cost_per_month_during_gap: 1000,
  cost_per_month_after_gap: 100,
  months_before_gap: 6,
  months_during_gap: 2,
  months_after_gap: 4
  )

drug_list.each do |drug|
  Medication.create(
    name: drug)
end


medications = Medication.all 
medications.each do |medication|
  UserMedication.create(
    user_id: 1,
    medication_id: medication.id)
end 


