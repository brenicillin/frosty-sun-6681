class Doctor < ApplicationRecord
  belongs_to :hospital
  has_many :doctor_patients
  has_many :patients, through: :doctor_patients

  def find_hospital
    hospital.name
  end

  def list_patients
    patients.pluck(:name).join(', ')
  end
end
