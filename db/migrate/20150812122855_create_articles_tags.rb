class CreateArticlesTags < ActiveRecord::Migration
  def change
    create_table :articles_tags do |t|
      t.belongs_to :articles
      t.belongs_to :tag

      t.timestamps null: false
    end
  end
end
