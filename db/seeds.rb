# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
Help.delete_all
Help.create(:quick_start=>'AiDashboard_User_Guide_v1.6.pdf', :full_manual=>'AiDashboard_User_Guide_v1.5.pdf', :su_quick_start=>'AiDashboard_SuperUser_Guide_v1.5.pdf', :su_full_manual=>'AiDashboard_SuperUser_Guide_v1.5.pdf', :support_email=>'support@aicuretechnologies.com', :support_phone=>'(800) 675-4960', :doc1=>'#', :doc2=>'#')
