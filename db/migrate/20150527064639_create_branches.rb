class CreateBranches < ActiveRecord::Migration
  def change
    create_table :branches do |t|
      t.string :name
      t.string :address
      t.string :contact
      t.decimal :lng
      t.decimal :lat

      t.timestamps null: false
    end
  end
end
