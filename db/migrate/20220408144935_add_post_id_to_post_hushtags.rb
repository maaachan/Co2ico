class AddPostIdToPostHushtags < ActiveRecord::Migration[6.1]
  def change
    add_column :post_hushtags, :post_id, :integer
  end
end
