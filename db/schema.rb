# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20130426213332) do

  create_table "dose_medicationships", :force => true do |t|
    t.integer  "patient_doseship_id"
    t.integer  "medication_id"
    t.integer  "num_pills"
    t.datetime "created_at",          :null => false
    t.datetime "updated_at",          :null => false
  end

  add_index "dose_medicationships", ["medication_id"], :name => "index_dose_medicationships_on_medication_id"
  add_index "dose_medicationships", ["patient_doseship_id"], :name => "index_dose_medicationships_on_patient_doseship_id"

  create_table "events", :force => true do |t|
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "helps", :force => true do |t|
    t.string   "quick_start"
    t.string   "full_manual"
    t.string   "su_quick_start"
    t.string   "su_full_manual"
    t.string   "doc1"
    t.string   "doc2"
    t.string   "support_email"
    t.string   "support_phone"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
  end

  create_table "medications", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "patient_doseships", :force => true do |t|
    t.integer  "patient_id"
    t.datetime "date"
    t.integer  "dose_id"
    t.time     "earliest_time"
    t.time     "alarm_time"
    t.time     "late_time"
    t.time     "miss_time"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  add_index "patient_doseships", ["patient_id"], :name => "index_patient_doseships_on_patient_id"

  create_table "patients", :force => true do |t|
    t.string   "first_name"
    t.string   "middle_name"
    t.string   "last_name"
    t.string   "gender"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "users", :force => true do |t|
    t.string   "username"
    t.string   "hashed_password"
    t.string   "salt"
    t.datetime "created_at",                                             :null => false
    t.datetime "updated_at",                                             :null => false
    t.string   "email",           :default => "richard.zhou@aicure.com"
  end

end
