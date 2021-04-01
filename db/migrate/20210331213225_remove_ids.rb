class RemoveIds < ActiveRecord::Migration[6.1]
  def change
    remove_column :categories, :user_id
    remove_column :tasks, :category_id
  end
end
