class CreateVacations < ActiveRecord::Migration
  def change
    create_table :vacations do |t|
      t.integer :total_cost
      t.string :description
      t.integer :total_people

      t.timestamps null: false
    end
  end
end
