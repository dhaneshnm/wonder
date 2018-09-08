class AddTitleToFeed < ActiveRecord::Migration[5.2]
  def change
    add_column :feeds, :title, :string
  end
end
