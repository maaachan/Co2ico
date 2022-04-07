class AddColunmsToHushtags < ActiveRecord::Migration[6.1]
  def change
    add_column :hushtags, :post_hushtag_id, :integer
  end
end
