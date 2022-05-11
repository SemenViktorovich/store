class CreateLikes < ActiveRecord::Migration[5.2]
  def change
    create_table :likes do |t|
      t.integer :book_id, null: false, unique: true
      t.integer :user_id, null: false, unique: true

      t.timestamps
    end
  end
end
