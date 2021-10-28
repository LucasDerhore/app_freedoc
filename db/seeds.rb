require 'faker'

Doctor.destroy_all
Patient.destroy_all
Appointment.destroy_all
City.destroy_all
Specialty.destroy_all



20.times do
  city = City.create!(
    name: Faker::Address.city)
end

20.times do
 doctor = Doctor.create!(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    zip_code: Faker::Number.between(from: 1000, to: 97000),
    city_id: City.all.sample.id)
end

Specialty.create!(specialty: "Charlatan")
Specialty.create!(specialty: "Escroc médical")
Specialty.create!(specialty: "Liseuse de bonnes aventures")
Specialty.create!(specialty: "Voyant(e)")
Specialty.create!(specialty: "Messmer t'hypnotise")
Specialty.create!(specialty: "Vaudouiste")  

20.times do
  patient = Patient.create!(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    city_id: City.all.sample.id)
end
   
20.times do
  appointment = Appointment.create!(
  doctor: Doctor.all.sample,
  patient: Patient.all.sample,
  doctor_id: Doctor.all.sample.id,
  patient_id: Patient.all.sample.id,
  date: Faker::Time.between_dates(from: Date.today - 5, to: Date.today + 5, period: :afternoon, format: :default),
  city_id: City.all.sample.id)
end

20.times do
  join = JoinTableSpecialty.create!(doctor: Doctor.all.select(:id).sample, specialty: Specialty.all.select(:id).sample)
end




# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

