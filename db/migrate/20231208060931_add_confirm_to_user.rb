class AddConfirmToUser < ActiveRecord::Migration[7.1]
  def change
    add_column :users, :confirm, :boolean
  end
end
