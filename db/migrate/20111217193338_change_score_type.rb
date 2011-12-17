class ChangeScoreType < ActiveRecord::Migration
  def up
      change_table :user_keyword_scores do |t|
        t.change :score, :float
      end
  end

  def down
      change_table :user_keyword_scores do |t|
        t.change :score, :integer
      end
  end
end
