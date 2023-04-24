class PatientsController < ApplicationController
  def index
    @patients = Patient.adults.alphabetical
  end
end