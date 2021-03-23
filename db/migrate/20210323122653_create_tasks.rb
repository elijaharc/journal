class CreateTasks < ActiveRecord::Migration[6.1]
  def change
    create_table :tasks do |t|
      t.string :item
      t.text :description
      t.integer :category

      t.timestamps
    end
  end
end
