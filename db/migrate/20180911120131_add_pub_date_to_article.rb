class AddPubDateToArticle < ActiveRecord::Migration[5.2]
  def change
    add_column :articles, :pub_date, :datetime
  end
end
