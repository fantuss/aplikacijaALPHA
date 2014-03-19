class AddShapeToProducts < ActiveRecord::Migration
  def change
    add_column :products, :shape, :string
  end
end
