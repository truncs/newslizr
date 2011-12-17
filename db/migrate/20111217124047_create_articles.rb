class CreateArticles < ActiveRecord::Migration
  def change
    create_table :articles do |t|
      t.string :name
      t.string :url
      t.integer :daylife_score
      t.text :excerpt
      t.text :headline
      t.integer :timestamp_epoch
      t.string :url

      t.timestamps
    end
  end
end
