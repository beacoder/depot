class AddQuantityToLineItems < ActiveRecord::Migration[5.1]
  def change
    # [27] update: set default value for newly added column
    add_column :line_items, :quantity, :integer, default: 1
  end
end
