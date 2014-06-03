class AddAttachmentPhotoToPaintings < ActiveRecord::Migration
  def self.up
    add_attachment :paintings, :photo
  end

  def self.down
    remove_attachment :paintings, :photo
  end
end