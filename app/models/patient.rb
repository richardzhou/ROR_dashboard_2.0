class Patient < ActiveRecord::Base
  attr_accessible :first_name, :gender, :last_name, :middle_name
  has_many :patient_doseships
  has_many :dose_medicationships, :through => :patient_doseships
end
