class CreateO2oSettings < ActiveRecord::Migration
  def change
    create_table :o2o_settings do |t|
      t.string :var
      t.string :value

      t.timestamps null: false
    end
  end
end
