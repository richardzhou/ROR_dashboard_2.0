class CreateHelps < ActiveRecord::Migration
  def change
    create_table :helps do |t|
      t.string :quick_start
      t.string :full_manual
      t.string :su_quick_start
      t.string :su_full_manual
      t.string :doc1
      t.string :doc2
      t.string :support_email
      t.string :support_phone
      t.timestamps
    end
  end
end
