class AddAboutToUsers < ActiveRecord::Migration[7.2]
  def change
    add_column :users, :about, :text
  end
end
