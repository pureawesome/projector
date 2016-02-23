class CreateResources < ActiveRecord::Migration
  def change
    create_table :resources do |t|
      t.string :name
      t.text :description
      t.datetime :start_datetime
      t.datetime :end_datetime

      t.timestamps
    end
  end
end

# TODO: Remove dates
