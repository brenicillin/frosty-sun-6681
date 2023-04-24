require 'rails_helper'

RSpec.describe Doctor do
  it {should belong_to :hospital}
  it {should have_many :doctor_patients}
  it {should have_many(:patients).through(:doctor_patients)}

  before(:all) do 
    @hospital = Hospital.create!(name: 'Princeton-Plainsboro Teaching Hospital')
    @doctor = @hospital.doctors.create!(name: 'Gregory House', specialty: 'Diagnostic Medicine', university: 'Johns Hopkins University')
  end

  describe 'instance methods' do
    it '#find_hospital' do
      expect(@doctor.find_hospital).to eq(@hospital.name)
    end
  end
end
