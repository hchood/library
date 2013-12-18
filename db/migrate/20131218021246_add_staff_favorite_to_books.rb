class AddStaffFavoriteToBooks < ActiveRecord::Migration
  def up
    add_column :books, :staff_favorite, :boolean, default: false
  end

  def down
    remove_column :books, :staff_favorite
  end
end
