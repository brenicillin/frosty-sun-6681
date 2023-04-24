require 'rails_helper'

RSpec.describe 'Doctor Show Page' do
  before(:all) do
    @hospital = Hospital.create!(name: 'Princeton-Plainsboro Teaching Hospital')
    @doctor = @hospital.doctors.create!(name: 'Gregory House', specialty: 'Diagnostic Medicine', university: 'Johns Hopkins University')
    @patient = Patient.create!(name: 'Rebecca Pope', age: 32)
    @doctor_patient = DoctorPatient.create!(doctor: @doctor, patient: @patient)
  end
  describe 'User Story 1' do
    it 'shows the doctors information' do
      visit doctor_path(@doctor)
      
      expect(page).to have_content(@doctor.name)
      
      within '#doctor-info' do
        expect(page).to have_content(@doctor.specialty)
        expect(page).to have_content(@doctor.university)
      end

      within '#hospital-info' do
        expect(page).to have_content(@hospital.name)
      end

      within '#patients' do
        expect(page).to have_content(@patient.name)
        expect(page).to_not have_content('Bob Kelso')
      end
    end
  end
end