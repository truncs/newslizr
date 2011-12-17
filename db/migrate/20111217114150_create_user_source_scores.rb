class CreateUserSourceScores < ActiveRecord::Migration
  def change
    create_table :user_source_scores do |t|

      t.timestamps
    end
  end
end
