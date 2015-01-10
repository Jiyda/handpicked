class CreateServices < ActiveRecord::Migration
  def change
    create_table :services do |t|
      t.string :name
      t.text :description
      t.string :imageurl
      t.integer :category_id

      t.timestamps
    end
  end
end
