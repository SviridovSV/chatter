class CreatePosts < ActiveRecord::Migration[5.1]
  def change
    create_table :posts do |t|
      t.text :title
      t.text :content
      t.references :user, index: true, foreign_key: true

      t.timestamps
    end
  end
end
