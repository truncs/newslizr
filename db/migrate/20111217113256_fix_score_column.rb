class FixScoreColumn < ActiveRecord::Migration
  def up
    rename_column :keywords, :scores, :score
  end

  def down
    rename_column :keywords, :score, :scores
  end
end
