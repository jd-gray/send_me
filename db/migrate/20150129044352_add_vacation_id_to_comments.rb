class AddVacationIdToComments < ActiveRecord::Migration
  def change
    add_column :comments, :vacation_id, :integer
  end
end
