class AddUserIdToSuperDUploads < ActiveRecord::Migration[5.1]
  def change
    add_column :super_d_uploads, :user_id, :integer
  end
end
