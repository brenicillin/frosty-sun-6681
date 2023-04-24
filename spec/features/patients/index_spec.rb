require 'rails_helper'

RSpec.describe 'Patient Index Page' do
  before(:each) do
    @patient_1 = Patient.create!(name: 'Rza', age: 24)
    @patient_2 = Patient.create!(name: 'Method Man', age: 39)
    @patient_3 = Patient.create!(name: 'James Evans', age: 14)
    @patient_4 = Patient.create!(name: 'Ohdee Bee', age: 32)
    @patient_5 = Patient.create!(name: 'Gza', age: 17)
    @patient_6 = Patient.create!(name: 'Ghostface Killah', age: 75)
    @patient_7 = Patient.create!(name: 'Inspectah Deck', age: 18)
    @patient_8 = Patient.create!(name: 'Raekwon', age: 17)
    @patient_9 = Patient.create!(name: 'U-God', age: 16)
  end

  describe 'User Story 3' do
    it 'shows the names of all adult patients' do
      visit patients_path
      
      expect(page).to have_content(@patient_1.name)
      expect(page).to have_content(@patient_2.name)
      expect(page).to have_content(@patient_4.name)
      expect(page).to have_content(@patient_6.name)
      expect(page).to have_content(@patient_7.name)
      expect(page).to_not have_content(@patient_3.name)
      expect(page).to_not have_content(@patient_5.name)
      expect(page).to_not have_content(@patient_8.name)
      expect(page).to_not have_content(@patient_9.name)
    end

    it 'lists patients in alphabetical order' do
      visit patients_path

      expect(@patient_6.name).to appear_before(@patient_7.name)
      expect(@patient_7.name).to appear_before(@patient_2.name)
      expect(@patient_2.name).to appear_before(@patient_4.name)
      expect(@patient_4.name).to appear_before(@patient_1.name)
    end
  end
end