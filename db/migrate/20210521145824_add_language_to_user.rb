class AddLanguageToUser < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :language, :string, default: :en
  end
end
