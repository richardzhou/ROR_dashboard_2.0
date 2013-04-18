class Help < ActiveRecord::Base
  attr_accessible :quick_start, :full_manual, :su_quick_start, :su_full_manual, :support_email, :support_phone, :doc1, :doc2

  #never-changing data can be stored into memory using CONSTANT when Rails starts
  QUICK_START=Help.first.quick_start
  FULL_MANUAL=Help.first.full_manual
  SU_QUICK_START=Help.first.su_quick_start
  SU_FULL_MANUAL=Help.first.su_full_manual
  SUPPORT_EMAIL=Help.first.support_email
  SUPPORT_PHONE=Help.first.support_phone
  DOC1=Help.first.doc1
  DOC2=Help.first.doc2
end
