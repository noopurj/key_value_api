class MakeTimeAndKeyUniqueInValues < ActiveRecord::Migration
  def change
    add_index :values, [:key, :time], unique: true
  end
end
