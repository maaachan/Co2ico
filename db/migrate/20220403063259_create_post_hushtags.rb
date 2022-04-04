class CreatePostHushtags < ActiveRecord::Migration[6.1]
  def change
    create_table :post_hushtags do |t|

      t.timestamps
    end
  end
end
