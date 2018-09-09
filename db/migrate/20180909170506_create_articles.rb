class CreateArticles < ActiveRecord::Migration[5.2]
  def change
    create_table :articles do |t|
      t.string :link
      t.text :description
      t.string :sentiment
      t.integer :sentiment_score
      t.references :feed, foreign_key: true

      t.timestamps
    end
  end
end
