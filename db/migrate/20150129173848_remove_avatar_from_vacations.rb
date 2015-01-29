class RemoveAvatarFromVacations < ActiveRecord::Migration
  def change
    remove_column :vacations, :avatar, :string
  end
end
