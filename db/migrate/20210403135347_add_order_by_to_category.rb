class AddOrderByToCategory < ActiveRecord::Migration[6.1]
  def change
    add_column :categories, :order_by, :string
  end
end
