class CreateProvices < ActiveRecord::Migration
  def change
    create_table :provices do |t|
      t.string :name

      t.timestamps null: false
    end
  end
end
