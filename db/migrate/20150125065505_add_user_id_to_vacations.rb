class AddUserIdToVacations < ActiveRecord::Migration
  def change
    add_column :vacations, :user_id, :integer
    add_index :vacations, :user_id
  end
end
