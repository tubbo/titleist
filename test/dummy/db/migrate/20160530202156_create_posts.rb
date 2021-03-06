# typed: true
class CreatePosts < ActiveRecord::Migration[5.2]
  def change
    create_table :posts do |t|
      t.string :name, unique: true
      t.text :body

      t.timestamps null: false
    end
  end
end
