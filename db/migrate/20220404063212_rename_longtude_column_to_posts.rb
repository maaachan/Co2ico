class RenameLongtudeColumnToPosts < ActiveRecord::Migration[6.1]
  def change
    rename_column :posts, :longtude, :longitude
  end
end
