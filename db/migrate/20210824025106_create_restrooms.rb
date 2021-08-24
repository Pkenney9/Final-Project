class CreateRestrooms < ActiveRecord::Migration[6.0]
  def change
    create_table :restrooms do |t|
      t.string :name
      t.string :location
      t.integer :score
      t.text :review_notes

      t.timestamps
    end
  end
end
