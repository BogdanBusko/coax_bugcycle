class AddBugcycleIdToUsed < ActiveRecord::Migration[5.1]
  def change
    add_column :useds, :bugcycle_id, :integer
  end
end
