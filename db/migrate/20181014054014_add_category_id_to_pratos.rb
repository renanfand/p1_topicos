class AddCategoryIdToPratos < ActiveRecord::Migration[5.2]
  def change
    add_column :pratos, :category_id, :integer
  end
end
