class CreatePublishers < ActiveRecord::Migration
  def change
      create_table :publishers do |table|
        table.column :name, :string, :limit => 255, :null => false, :unique => true
    end
  end
end