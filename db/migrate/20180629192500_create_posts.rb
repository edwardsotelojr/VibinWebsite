class CreatePosts < ActiveRecord::Migration[5.2]
  def change
    create_table :posts do |t|
      t.references :user, index: true, foreign_key: true
      t.text :content
      t.timestamps
    end
    add_index :posts, [:user_id, :created_at]
  end
end
