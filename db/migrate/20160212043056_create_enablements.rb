class CreateEnablements < ActiveRecord::Migration
  def change
    create_table :enablements do |t|
      t.integer :project_id
      t.integer :resource_id

      t.references :project, index: true, foreign_key: true
      t.references :resource, index: true, foreign_key: true
    end
  end
end
