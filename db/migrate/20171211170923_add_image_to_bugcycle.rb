class AddImageToBugcycle < ActiveRecord::Migration[5.1]
  def change
    add_column :bugcycles, :image, :string
  end
end
