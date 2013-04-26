class CreateDoseMedicationships < ActiveRecord::Migration
  def change
    create_table :dose_medicationships do |t|
      t.references :patient_doseship, :index => true
      t.references :medication, :index => true
      t.integer    :num_pills

      t.timestamps
    end
# :index=>true dosen't work ^_^!--, so have to add index separately either by writing another migration file or call .index method below
  change_table :dose_medicationships do |t|
      t.index    :patient_doseship_id
      t.index    :medication_id
    end
  end
end
