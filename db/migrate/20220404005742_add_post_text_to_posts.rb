class AddPostTextToPosts < ActiveRecord::Migration[6.1]
  def change
    add_column :posts, :post_text, :text
  end
end
