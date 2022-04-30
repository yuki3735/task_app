class CreatePosts < ActiveRecord::Migration[6.1]
  def change
    create_table :posts do |t|
      t.string :name
      t.date :start
      t.date :finish
      t.boolean :allday
      t.datetime :update_at
      t.text :memo

      t.timestamps
    end
  end
end
