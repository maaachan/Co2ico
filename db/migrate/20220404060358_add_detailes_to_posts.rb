class AddDetailesToPosts < ActiveRecord::Migration[6.1]
  def change
    add_column :posts, :address, :string
    add_column :posts, :latitude, :float
    add_column :posts, :longtude, :float
  end
end
