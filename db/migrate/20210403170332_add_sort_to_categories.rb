class AddSortToCategories < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :order_categories_by, :string
  end
end
