# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'ffaker'


defects = ["Air Compressor", "Air Lines", "Battery", "Belts/Hoses", 
           "Body", "Brake Accessories", "Brakes, Parking", "Brakes, Service",
           "Clutch", "Coupling Devices", "Defroster/Heater", "Drive Line", "Engine",
           "Exhaust", "Fifth Wheel", "Fluid Levels", "Frame/Assembly", "Front Axle",
           "Fuel Tanks", "Horn", "Lights", "Mirrors", "Muffler", "Oil Pressure", "Radiator",
           "Reflectors", "Safety Equipment", "Starter", "Steering", "Suspension System",
           "Tire Chains", "Tires", "Transmission", "Trip Recorder", "Wheels/Rims", "Windshield Wipers",
           "Other"
          ]

defects.each_with_index do |d, i|
  Defect.create(name: defects[i], is_active: true)
end

5.times do 
  c = Company.create(name: FFaker::Company.name, provision_key: FFaker::Skill.tech_skill, user_cap: 5)
  5.times do 
    Truck.create(vehicle_number: rand(100..999), last_service_date: Time.now - rand(1..5).days, last_odometer_reading: rand(1000..99999), last_odometer_date: Time.now - rand(1..5).days, is_active: rand(0..1), company_id: c.id)
  end
    5.times do 
    u = User.create(first_name: FFaker::Name.first_name, last_name: FFaker::Name.last_name, contact_number: FFaker::PhoneNumber.short_phone_number, email: FFaker::Internet.email, account_type: rand(1..2), company_id: c.id)
    5.times do
      Report.create(is_complete: true, street: FFaker::AddressUS.street_address, city: FFaker::AddressUS.city, state: FFaker::AddressUS.state_abbr, zipcode: FFaker::AddressUS.zip_code, completion_date: Time.now - rand(1..15).days, user_id: u.id)
    end
  end
end
