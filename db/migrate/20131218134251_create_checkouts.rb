class CreateCheckouts < ActiveRecord::Migration
  def change
    create_table :checkouts do |t|
      t.string :reader_name, null: false
      t.integer :book_id, null: false
      t.date :due_date, null: false

      t.timestamps
    end
  end
end
