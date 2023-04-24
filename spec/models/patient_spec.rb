require 'rails_helper'

RSpec.describe Patient do
  describe 'relationships' do
    it {should have_many :doctor_patients}
    it {should have_many(:doctors).through(:doctor_patients)}
  end

  before(:each) do
    @patient_1 = Patient.create!(name: 'Katie Bryce', age: 24)
    @patient_2 = Patient.create!(name: 'Denny Duquette', age: 39)
    @patient_3 = Patient.create!(name: 'James Evans', age: 14)
    @patient_4 = Patient.create!(name: 'Rebecca Pope', age: 32)
  end

  describe 'class_methods' do
    it 'can find adult patients' do   
      expect(Patient.adults).to eq([@patient_1, @patient_2, @patient_4])
    end

    it 'can sort patients alphabetically' do
      expect(Patient.alphabetical).to eq([@patient_2, @patient_3, @patient_1, @patient_4])
    end
  end
end