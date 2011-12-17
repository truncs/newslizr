class CreateUserKeywordScores < ActiveRecord::Migration
  def change
    create_table :user_keyword_scores do |t|
      t.integer :user_id
      t.integer :keyword_id
      t.integer :score
      t.timestamps

    end
  end
end
