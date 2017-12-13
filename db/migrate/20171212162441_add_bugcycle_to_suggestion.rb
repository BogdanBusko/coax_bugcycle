class AddBugcycleToSuggestion < ActiveRecord::Migration[5.1]
  def change
    add_reference :suggestions, :bugcycle, foreign_key: true
  end
end
