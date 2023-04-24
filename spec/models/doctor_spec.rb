require 'rails_helper'

RSpec.describe Doctor do
  it {should belong_to :hospital}
  it {should have_many :doctor_patients}
  it {should have_many(:patients).through(:doctor_patients)}

  before(:all) do 
    @hospital = Hospital.create!(name: 'Princeton-Plainsboro Teaching Hospital')
    @doctor = @hospital.doctors.create!(name: 'Gregory House', specialty: 'Diagnostic Medicine', university: 'Johns Hopkins University')
    @patient_1 = Patient.create!(name: 'Rebecca Pope', age: 32)
    @patient_2 = Patient.create!(name: "Alex Smith", age: 25)
    @doctor_patient = DoctorPatient.create!(doctor: @doctor, patient: @patient_1)
    @doctor_patient = DoctorPatient.create!(doctor: @doctor, patient: @patient_2)
  end

  describe 'instance methods' do
    it '#find_hospital' do
      expect(@doctor.find_hospital).to eq(@hospital.name)
    end

    it '#list_patients' do
      expect(@doctor.list_patients).to eq("#{@patient_1.name}, #{@patient_2.name}")
    end
  end
end
