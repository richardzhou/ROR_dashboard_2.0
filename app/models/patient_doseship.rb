class PatientDoseship < ActiveRecord::Base
  # attr_accessible :title, :body
  belongs_to :patient
  has_many   :dose_medicationships
  has_many   :medications, :through => :dose_medicationships
end
