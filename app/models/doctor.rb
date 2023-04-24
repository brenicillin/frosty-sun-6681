class Doctor < ApplicationRecord
  belongs_to :hospital
  has_many :doctor_patients
  has_many :patients, through: :doctor_patients

  def find_hospital
    hospital.name
  end

  def patient_count
    patients.size
  end

  def self.sort_by_patients
    joins(:doctor_patients)
    .group(:id)
    .order(Arel.sql('COUNT(doctor_patients.doctor_id) DESC'))
  end
end
