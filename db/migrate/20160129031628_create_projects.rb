class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.string :name
      t.text :description
      t.datetime :start_date
      t.datetime :end_date_projected
      t.datetime :end_date_actual
      t.float :budget
      t.float :cost
      
      t.timestamps
    end
  end
end
