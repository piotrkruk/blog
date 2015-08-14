class CreateArticlesTags < ActiveRecord::Migration
  def change
    create_table :articles_tags, id: false do |t|
      t.belongs_to :article, null: false
      t.belongs_to :tag, null: false

      t.timestamps null: false
    end

    add_index :articles_tags, [:article_id, :tag_id], unique: true
    add_index :articles_tags, [:tag_id, :article_id], unique: true
  end
end
