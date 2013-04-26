class DoseMedicationship < ActiveRecord::Base
  # attr_accessible :title, :body
  belongs_to :patient_doseship
  belongs_to :medication
end
