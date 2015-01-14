class AddColumnToProvider < ActiveRecord::Migration
  def change
    add_column :providers, :weighted_score, :integer , :default => 0
  end
end
