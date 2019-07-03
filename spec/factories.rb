FactoryBot.define do
  
  factory :user do
    first_name { "User" }
    last_name { 'Name' } 
    account_type { 'admin' }
    contact_number { '9139139922' }
    email { 'test@test.com' }
    employee_number { rand(1..900) }
  end
  
  factory :company do
    name { FFaker::Company.name }
    provision_key { FFaker::Skill.tech_skill } 
    user_cap { 5 } 
    street { FFaker::AddressUS.street_address } 
    city { FFaker::AddressUS.city } 
    state { FFaker::AddressUS.state_abbr } 
    zipcode { FFaker::AddressUS.zip_code }
  end
  
  factory :report do
    user
    company
    
    completion_date { Time.now } 
    street { '123' } 
    city { 'lenexa' } 
    state { 'KS' } 
    zipcode { '66215' } 
    
    trait :with_asset_check do
      after(:create) do |i|
        create_list :asset_check, 1, report: i
      end
    end
  end
  
  factory :asset do 
    company
    
    type { 'Truck' }
    asset_number { rand(100..10000).to_s }
    last_service_date { Time.now }
    last_odo_read_date { Time.now }
    last_odo_reading { 1000.1 }
    is_active { true }
  end
  
  factory :asset_check do
    asset
    report
    
  end
end