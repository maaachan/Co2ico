class AddHushtagIdToPostHushtags < ActiveRecord::Migration[6.1]
  def change
    add_column :post_hushtags, :hushtag_id, :integer
  end
end
