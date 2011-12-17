class CreateFeeds < ActiveRecord::Migration
  def change
    create_table :feeds do |t|
      t.integer :article_id
      t.integer :user_id
      t.integer :score
      t.integer :rating

      t.timestamps
    end
  end
end
