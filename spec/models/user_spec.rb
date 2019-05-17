require 'rails_helper'

RSpec.describe User, type: :model do
  subject {
    described_class.new(first_name: "Jim", last_name: "Jones", contact_number: "913-987-2323", email: "test@test.com", account_type: "admin")
    }
  it "is valid with valid attributes" do 
    expect(subject).to be_valid
  end
  
  it "is not valid with first_name" do 
    subject.first_name = nil
    expect(subject).to_not be_valid
  end
  
  it "is not valid without last_name" do 
    subject.last_name = nil
    expect(subject).to_not be_valid
  end
  
  it "is not valid without contact_number" do
    subject.contact_number = nil
    expect(subject).to_not be_valid
  end
  
  it "is not valid without email" do
    subject.email = nil
    expect(subject).to_not be_valid
  end
  
  it "is not valid without account_type" do
    subject.account_type = nil
    expect(subject).to_not be_valid
  end
  
  it "is not valid when is employee and company is missing" do
    subject.account_type = "employee"
    expect(subject).to_not be_valid
  end
  
  it "is not company employee when account type is admin" do
    expect(subject.is_company_employee?).to be_falsey
  end
  
  it "is admin when account tyep is admin" do
    expect(subject.is_admin?).to be_truthy
  end
  
  it "is company employee when account type is not admin" do
    subject.account_type = "employee" 
    expect(subject.is_company_employee?).to be_truthy
  end
  it 'should return last_name, first_name with fullname' do
    expect(subject.fullname).to eq("Jones, Jim")
  end
end
