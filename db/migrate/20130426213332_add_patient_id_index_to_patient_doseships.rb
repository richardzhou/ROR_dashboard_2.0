class AddPatientIdIndexToPatientDoseships < ActiveRecord::Migration
  def change
    add_index :patient_doseships, :patient_id
  end
end
