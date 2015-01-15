class AddAttachmentImageToProviders < ActiveRecord::Migration
  def self.up
    change_table :providers do |t|
      t.attachment :image
    end
  end

  def self.down
    remove_attachment :providers, :image
  end
end
