class MakeKeyIdNotNullableInValue < ActiveRecord::Migration
  def change
    change_column_null :values, :key_id, false
  end
end
