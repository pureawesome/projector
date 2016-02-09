class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.string :name
      t.text :description
      t.datetime :start_date
      t.datetime :due_date
      t.string :status

      t.timestamps
    end
  end
end
