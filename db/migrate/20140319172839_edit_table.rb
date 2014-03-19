class EditTable < ActiveRecord::Migration
  change_table :products do |t|
  t.remove :description, :price
  t.string :code
  t.string :category
  end
end
