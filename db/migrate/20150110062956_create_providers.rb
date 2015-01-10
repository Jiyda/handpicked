class CreateProviders < ActiveRecord::Migration
  def change
    create_table :providers do |t|
      t.string :name
      t.text :description
      t.string :website
      t.string :pricerange
      t.string :rating
      t.string :imageurl
      t.integer :service_id

      t.timestamps
    end
  end
end
