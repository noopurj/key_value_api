class MakeTimeAndKeyUniqueInValues < ActiveRecord::Migration
  def change
    add_index :values, [:key_id, :time], unique: true
  end
end
