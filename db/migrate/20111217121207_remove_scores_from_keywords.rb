class RemoveScoresFromKeywords < ActiveRecord::Migration
  def up
      remove_column :keywords, :score
  end

  def down
  end
end
