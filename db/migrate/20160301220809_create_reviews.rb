class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.references :product
      t.string :name
      t.integer :rating
      t.text :review

      t.timestamps null: false
    end
  end
end
