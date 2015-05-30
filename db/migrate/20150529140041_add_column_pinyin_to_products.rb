class AddColumnPinyinToProducts < ActiveRecord::Migration
  def change
    add_column :products, :pinyin, :string
  end
end
