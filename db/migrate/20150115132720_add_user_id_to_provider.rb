class AddUserIdToProvider < ActiveRecord::Migration
  def change
    add_column :providers, :user_id, :integer
    add_column :categories, :user_id, :integer
  end
end
