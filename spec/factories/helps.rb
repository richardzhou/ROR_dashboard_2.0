FactoryGirl.define do
  factory :only_help, :class =>:Help do
    quick_start "AiDashboard_User_Guide_v1.6.pdf"
    full_manual "AiDashboard_User_Guide_v1.5.pdf"
    su_quick_start "AiDashboard_SuperUser_Guide_v1.5.pdf"
    su_full_manual "AiDashboard_SuperUser_Guide_v1.5.pdf"
    support_email "support@aicuretechnologies.com"
    support_phone "(800) 675-4960"
    doc1 "#"
    doc2 "#"
  end
end