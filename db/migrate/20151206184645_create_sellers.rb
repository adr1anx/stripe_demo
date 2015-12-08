class CreateSellers < ActiveRecord::Migration
  def change
    create_table :sellers do |t|
      t.string :provider
      t.string :uid
      t.string :access_code
      t.string :publishable_key

      t.timestamps null: false
    end
  end
end
