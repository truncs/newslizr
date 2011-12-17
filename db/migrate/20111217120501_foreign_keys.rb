class ForeignKeys < ActiveRecord::Migration
  def up
      add_foreign_key(:user_source_scores, :users)
      add_foreign_key(:user_source_scores, :sources)
  end

  def down
  end
end
