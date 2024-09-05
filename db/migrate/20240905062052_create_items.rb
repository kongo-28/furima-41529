class CreateItems < ActiveRecord::Migration[7.0]
  def change
    create_table :items do |t|
      t.string :name
      t.text :explanation
      t.integer :category_id
      t.integer :condition_id
      t.integer :fee_id
      t.integer :prefecture_id
      t.integer :period_id
      t.integer :price
      t.references :user
      t.timestamps
    end
  end
end
