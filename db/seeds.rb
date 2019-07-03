# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'ffaker'


defects = [["Air Compressor", true, false], ["Air Lines", true, false], ["Battery", true, false], ["Belts/Hoses", true, false], 
           ["Body", true, false], ["Brake Accessories", true, false], ["Brake Connections", false, true], ["Brakes", false, true], 
           ["Brakes Parking", true, false], ["Brakes Service", true, false], ["Clutch", true, false], ["Coupling Devices", true, true],
           ["Coupling (King) Pin", false, true], ["Defroster/Heater", true, false], ["Drive Line", true, false], ["Doors", false, true], ["Engine", true, false],
           ["Exhaust", true, false], ["Fifth Wheel", true, false], ["Fluid Levels", true, false], ["Frame/Assembly"], ["Front Axle", true, false],
           ["Fuel Tanks", true, false], ["Hitch", false, true], ["Horn", true, false], ["Landing Gear", false, true], ["Lights", true, true], 
           ["Mirrors", true, false], ["Muffler", true, false], ["Oil Pressure", true, false], ["Radiator", true, false],
           ["Reflectors", true, true], ["Roof", false, true], ["Safety Equipment", true, false], ["Starter", true, false], 
           ["Steering", true, false], ["Suspension System", true, true], ["Tarpaulin", false, true],
           ["Tire Chains", true, false], ["Tires", true, true], ["Transmission", true, false], ["Trip Recorder", true, false], 
           ["Wheels/Rims", true, true], ["Windshield Wipers", true, false], ["Other", true, true]
          ]

defects.each_with_index do |d, i|
  Defect.create(name: defects[i][0], is_truck_defect: defects[i][1], is_trailer_defect: defects[i][2], is_active: true)
end

5.times do 
  c = Company.create(name: FFaker::Company.name, provision_key: FFaker::Skill.tech_skill, user_cap: 5, street: FFaker::AddressUS.street_address, city: FFaker::AddressUS.city, state: FFaker::AddressUS.state_abbr, zipcode: FFaker::AddressUS.zip_code)
  5.times do 
    Asset.create(asset_number: rand(100..999), last_service_date: Time.now - rand(1..5).days, last_odo_reading: rand(1000..99999), last_odo_read_date: Time.now - rand(1..5).days, is_active: rand(0..1), company_id: c.id, type: 'Truck')
  end
    5.times do 
    u = User.create(first_name: FFaker::Name.first_name, last_name: FFaker::Name.last_name, contact_number: FFaker::PhoneNumber.short_phone_number, email: FFaker::Internet.email, account_type: rand(1..2), company_id: c.id)
    5.times do
      Report.create(is_complete: true, street: FFaker::AddressUS.street_address, city: FFaker::AddressUS.city, state: FFaker::AddressUS.state_abbr, zipcode: FFaker::AddressUS.zip_code, completion_date: Time.now - rand(1..15).days, user_id: u.id)
    end
  end
end
