class AddEmialToUsers < ActiveRecord::Migration
  def change
    add_column :users, :email, :string, :default => "richard.zhou@aicure.com"
  end
end
