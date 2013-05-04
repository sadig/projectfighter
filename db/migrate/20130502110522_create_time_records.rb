class CreateTimeRecords < ActiveRecord::Migration
  def change
    create_table :time_records do |t|
      t.references :task
      t.boolean :started, :default=>false
      t.boolean :first, :default=>false
      t.boolean :last, :default=>false
      t.string :comment, :default=>''
      t.timestamps
    end
  end
end
