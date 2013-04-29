class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.string :slug
      t.string :title
      t.text :description
      t.references :owner

      t.timestamps
    end
    add_index :projects, [:owner_id]
  end
end
