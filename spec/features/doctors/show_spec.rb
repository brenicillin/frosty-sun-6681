require 'rails_helper'

RSpec.describe 'Doctor Show Page' do
  before(:all) do
    @hospital = Hospital.create!(name: 'Princeton-Plainsboro Teaching Hospital')
    @doctor = @hospital.doctors.create!(name: 'Gregory House', specialty: 'Diagnostic Medicine', university: 'Johns Hopkins University')
    @doctor_2 = @hospital.doctors.create!(name: 'Bob Kelso', specialty: 'General Medicine', university: 'Harvard University')
    @patient = Patient.create!(name: 'Rebecca Pope', age: 32)
    @doctor_patient = DoctorPatient.create!(doctor: @doctor, patient: @patient)
    @doctor_patient_2 = DoctorPatient.create!(doctor: @doctor_2, patient: @patient)
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

  describe 'User Story 2' do
    it 'has a button to remove a patient from the doctors patients' do
      visit doctor_path(@doctor)

      within '#patients' do
        expect(page).to have_button("Delete #{@patient.name}")
        click_button "Delete #{@patient.name}"
      end

      expect(current_path).to eq(doctor_path(@doctor))
      expect(page).to_not have_content(@patient.name)

      visit doctor_path(@doctor_2)
      
      within '#patients' do
        expect(page).to have_content(@patient.name)
      end
    end
  end
end