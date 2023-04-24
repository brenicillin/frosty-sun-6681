class HospitalsController < ApplicationController
  def show
    @hospital = Hospital.find(params[:id])
    @doctors = @hospital.doctors.sort_by_patients
  end
end