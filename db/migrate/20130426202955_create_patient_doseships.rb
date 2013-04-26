class CreatePatientDoseships < ActiveRecord::Migration
  def change
    create_table :patient_doseships do |t|
      t.references :patient, :index => true
      t.datetime   :date
      t.integer    :dose_id
      t.time       :earliest_time
      t.time       :alarm_time
      t.time       :late_time
      t.time       :miss_time

      t.timestamps
    end
  end
end
