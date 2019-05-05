class CreateListings < ActiveRecord::Migration[5.2]
  def change
    create_table :listings do |t|
      t.string :name
      t.text :description
      t.integer :condition
      t.string :type
      t.integer :price
      t.integer :year
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
