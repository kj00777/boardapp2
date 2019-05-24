class AddUserTypeToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :user_type, :integer, default: 0, null: false, limit: 1
  end
end
