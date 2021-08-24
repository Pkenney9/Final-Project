class CreateRatings < ActiveRecord::Migration[6.0]
  def change
    create_table :ratings do |t|
      t.integer :user_id
      t.integer :restroom_id
      t.integer :score
      t.text :review_notes
      t.string :name
      t.string :location

      t.timestamps
    end
  end
end
