class AddNullConstraintsToBooks < ActiveRecord::Migration
  def up
    change_column :books, :title, :string, null: false
    change_column :books, :author, :string, null: false
  end

  def down
    change_column :books, :author, :string
    change_column :books, :title, :string
  end
end
