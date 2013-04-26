class Medication < ActiveRecord::Base
  attr_accessible :name
  has_many :dose_medicationships
  has_many :patient_doseships, :through => :dose_medicationships
end
