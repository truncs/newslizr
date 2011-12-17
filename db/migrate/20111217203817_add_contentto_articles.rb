class AddContenttoArticles < ActiveRecord::Migration
  def up
      add_column :articles,:content, :string
  end


  def down
      remove_column :articles, :content
  end
end
