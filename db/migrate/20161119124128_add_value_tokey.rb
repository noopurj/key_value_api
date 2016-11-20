class AddValueTokey < ActiveRecord::Migration
  def change
    add_reference :values, :key, index: true
  end
end
