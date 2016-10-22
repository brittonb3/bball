class AddAttachmentFileToDrills < ActiveRecord::Migration
  def self.up
    change_table :drills do |t|
      t.attachment :file
    end
  end

  def self.down
    remove_attachment :drills, :file
  end
end
