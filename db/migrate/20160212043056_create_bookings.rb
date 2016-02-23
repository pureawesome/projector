class CreateBookings < ActiveRecord::Migration
  def change
    create_table :bookings do |t|
      t.integer :project_id
      t.integer :resource_id

      t.references :project, index: true, foreign_key: true
      t.references :resource, index: true, foreign_key: true
    end
  end
end

# TODO: Create date fields
