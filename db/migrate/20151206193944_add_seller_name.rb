class AddSellerName < ActiveRecord::Migration
  def change
    add_column :sellers, :name, :string
  end
end
