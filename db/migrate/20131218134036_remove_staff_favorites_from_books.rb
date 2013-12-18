class RemoveStaffFavoritesFromBooks < ActiveRecord::Migration
  def up
    remove_column :books, :staff_favorite
  end

  def down
    add_column :books, :staff_favorite, :boolean, default: false
  end
end
