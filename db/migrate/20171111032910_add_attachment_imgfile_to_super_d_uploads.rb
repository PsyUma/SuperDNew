class AddAttachmentImgfileToSuperDUploads < ActiveRecord::Migration[5.1]
  def self.up
    change_table :super_d_uploads do |t|
      t.attachment :imgfile
    end
  end

  def self.down
    remove_attachment :super_d_uploads, :imgfile
  end
end
