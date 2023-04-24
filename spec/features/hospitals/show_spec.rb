require 'rails_helper'

RSpec.describe 'Hospital Show Page' do
  before(:each) do
    @hospital_1 = Hospital.create!(name: 'Princeton-Plainsboro Teaching Hospital')
    @doctor_1 = @hospital_1.doctors.create!(name: 'Gregory House', specialty: 'Diagnostic Medicine', university: 'Johns Hopkins University')
    @doctor_2 = @hospital_1.doctors.create!(name: 'James Wilson', specialty: 'Oncology', university: 'Johns Hopkins University')
    @patient_1 = Patient.create!(name: 'Rza', age: 24)
    @patient_2 = Patient.create!(name: 'Gza', age: 39)
    @patient_3 = Patient.create!(name: 'Oh Deebee', age: 32)
    @patient_4 = Patient.create!(name: 'Rae Kwon', age: 22)
    @doctor_1.patients << @patient_1
    @doctor_1.patients << @patient_2
    @doctor_1.patients << @patient_3
    @doctor_2.patients << @patient_4
  end

  describe 'Extension' do
    it 'I see the hospitals name' do
      visit hospital_path(@hospital_1)
      
      expect(page).to have_content(@hospital_1.name)
    end

    it 'I see the names of all of its doctors' do
      visit hospital_path(@hospital_1)
      
      within '#doctors' do
        expect(page).to have_content(@doctor_1.name)
        expect(page).to have_content(@doctor_2.name)
      end
    end

    it 'Next to each doctor I see the number of patients that doctor has' do
      visit hospital_path(@hospital_1)
      
      within '#doctors' do
        expect(page).to have_content(@doctor_1.name)
        expect(page).to have_content(@doctor_2.name)
        expect(page).to have_content(@doctor_1.patients.count)
        expect(page).to have_content(@doctor_2.patients.count)
      end
    end

    it 'I see that the list of doctors is ordered from most patients to least patients' do
      visit hospital_path(@hospital_1)

      within '#doctors' do
        expect(@doctor_1.name).to appear_before(@doctor_2.name)
      end
    end
  end
end