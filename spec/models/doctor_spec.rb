require 'rails_helper'

RSpec.describe Doctor do
  it {should belong_to :hospital}
  it {should have_many :doctor_patients}
  it {should have_many(:patients).through(:doctor_patients)}

  before(:each) do 
    @hospital = Hospital.create!(name: 'Princeton-Plainsboro Teaching Hospital')
    @doctor_1 = @hospital.doctors.create!(name: 'Gregory House', specialty: 'Diagnostic Medicine', university: 'Johns Hopkins University')
    @doctor_2 = @hospital.doctors.create!(name: 'James Wilson', specialty: 'Oncology', university: 'Johns Hopkins University')
    @patient_1 = Patient.create!(name: 'Rza', age: 24)
    @patient_2 = Patient.create!(name: 'Gza', age: 39)
    @patient_3 = Patient.create!(name: 'Oh Deebee', age: 32)
    @patient_4 = Patient.create!(name: 'Rae Kwon', age: 22)
    @doctor_2.patients << @patient_1
    @doctor_2.patients << @patient_2
    @doctor_1.patients << @patient_3
    @doctor_2.patients << @patient_4
  end

  describe 'class methods' do
    it '.sort_by_patients' do
      expect(Doctor.sort_by_patients).to eq([@doctor_2, @doctor_1])
    end
  end

  describe 'instance methods' do
    it '#find_hospital' do
      expect(@doctor_1.find_hospital).to eq(@hospital.name)
    end

    it '#patient_count' do
      expect(@doctor_1.patient_count).to eq(1)
      expect(@doctor_2.patient_count).to eq(3)
    end
  end
end
