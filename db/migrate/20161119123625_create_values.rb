class CreateValues < ActiveRecord::Migration
  def change
    create_table :values do |t|
      t.string :time
      t.string :data

      t.timestamps null: false
    end
  end
end
