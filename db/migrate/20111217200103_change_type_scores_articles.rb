class ChangeTypeScoresArticles < ActiveRecord::Migration
  def up
    change_table :articles do |t|
       t.change :daylife_score, :float
    end
    change_table :feeds do |t|
      t.change :score, :float
    end
  end

  def down
    change_table :articles do |t|
       t.change :daylife_score, :integer
    end
    change_table :feeds do |t|
      t.change :score, :integer
    end
  end
end
