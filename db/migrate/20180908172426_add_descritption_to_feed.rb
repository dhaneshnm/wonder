class AddDescritptionToFeed < ActiveRecord::Migration[5.2]
  def change
    add_column :feeds, :description, :string
  end
end
