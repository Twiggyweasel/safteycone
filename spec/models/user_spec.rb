require 'rails_helper'

RSpec.describe User, type: :model do
  subject { create(:user) }
  
  describe "Associations" do 
    it { should have_many(:reports) }
    it { should define_enum_for(:account_type) }
  end
  describe "Validations" do  
    it "is valid with valid attributes" do 
      expect(subject).to be_valid
    end

    it "is invalid without first_name" do 
      subject.first_name = nil
      expect(subject).to_not be_valid
    end

    it "is invalid without last_name" do 
      subject.last_name = nil
      expect(subject).to_not be_valid
    end

    it "is invalid without contact_number" do
      subject.contact_number = nil
      expect(subject).to_not be_valid
    end

    it "is invalid without email" do
      subject.email = nil
      expect(subject).to_not be_valid
    end

    it "is invalid without account_type" do
      subject.account_type = nil
      expect(subject).to_not be_valid
    end

    it "is invalid when is employee and company is missing" do
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
      expect(subject.fullname).to eq("Name, User")
    end
  end
end
