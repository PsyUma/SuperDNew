class CreateSuperDUploads < ActiveRecord::Migration[5.1]
  def change
    create_table :super_d_uploads do |t|
      t.string :title
      t.text :body

      t.timestamps
    end
  end
end
