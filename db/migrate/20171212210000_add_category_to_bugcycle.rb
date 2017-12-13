class AddCategoryToBugcycle < ActiveRecord::Migration[5.1]
  def change
    add_reference :bugcycles, :category, foreign_key: true
  end
end
