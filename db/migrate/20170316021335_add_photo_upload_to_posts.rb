class AddPhotoUploadToPosts < ActiveRecord::Migration[5.0]
  def change
    add_column :posts, :photo_upload, :string
  end
end
