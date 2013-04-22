class Help < ActiveRecord::Base
  attr_accessible :quick_start, :full_manual, :su_quick_start, :su_full_manual, :support_email, :support_phone, :doc1, :doc2
  attr_accessor :quick_start, :full_manual, :su_quick_start, :su_full_manual, :support_email, :support_phone, :doc1, :doc2
  #never-changing data can be stored into memory using CONSTANT when Rails starts (only effective in production mode)
  QUICK_START=self.first.quick_start
  FULL_MANUAL=self.first.full_manual
  SU_QUICK_START=self.first.su_quick_start
  SU_FULL_MANUAL=self.first.su_full_manual
  SUPPORT_EMAIL=self.first.support_email
  SUPPORT_PHONE=self.first.support_phone
  DOC1=self.first.doc1
  DOC2=self.first.doc2
=begin
  QUICK_START=self.find_by_quick_start('AiDashboard_User_Guide_v1.6.pdf').quick_start
  FULL_MANUAL=self.find_by_full_manual('AiDashboard_User_Guide_v1.5.pdf').full_manual
  SU_QUICK_START=self.find_by_su_quick_start('AiDashboard_SuperUser_Guide_v1.5.pdf').su_quick_start
  SU_FULL_MANUAL=self.find_by_su_full_manual('AiDashboard_SuperUser_Guide_v1.5.pdf').su_full_manual
  SUPPORT_EMAIL=self.find_by_support_email('support@aicuretechnologies.com').support_email
  SUPPORT_PHONE=self.find_by_support_phone('(800) 675-4960').support_phone
  DOC1=self.find_by_doc1('#').doc1
  DOC2=self.find_by_doc2('#').doc2
=end


end
