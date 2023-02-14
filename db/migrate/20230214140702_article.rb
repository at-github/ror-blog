class Article < ActiveRecord::Migration[7.0]
  def change
    add_column :articles, :article_type, :integer, default: 0
  end
end
