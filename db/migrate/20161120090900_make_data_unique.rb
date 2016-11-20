class MakeDataUnique < ActiveRecord::Migration
  def change
    add_index :keys, :data, :unique => true
  end
end
