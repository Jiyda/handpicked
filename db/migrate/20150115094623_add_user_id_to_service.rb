class AddUserIdToService < ActiveRecord::Migration
  def change
    add_column :services, :user_id, :integer
    add_column :services, :is_approved, :string
  end
end
