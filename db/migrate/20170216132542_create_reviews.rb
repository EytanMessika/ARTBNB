class CreateReviews < ActiveRecord::Migration[5.0]
  def change
    create_table :reviews do |t|
      t.date :date
      t.text :body
      t.integer :rating
      t.references :booking, foreign_key: true

      t.timestamps
    end
  end
end
