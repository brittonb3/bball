class AddAttachmentDocumentToPlays < ActiveRecord::Migration
  def self.up
    change_table :plays do |t|
      t.attachment :document
    end
  end

  def self.down
    remove_attachment :plays, :document
  end
end
