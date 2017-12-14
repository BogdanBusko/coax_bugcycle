class CreateUseds < ActiveRecord::Migration[5.1]
  def change
    create_table :useds do |t|

      t.timestamps
    end
  end
end
