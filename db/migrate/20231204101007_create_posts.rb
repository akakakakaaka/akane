class CreatePosts < ActiveRecord::Migration[6.1]
  def change
    create_table :posts do |t|
      t.string :name
      t.text :address
      t.integer :price
      t.text :about
      t.integer :number
      t.string :area

      t.timestamps
    end
  end
end
