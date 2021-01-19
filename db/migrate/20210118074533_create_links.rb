class CreateLinks < ActiveRecord::Migration[6.1]
  def change
    create_table :links do |t|

      t.string :url_code, null: false
      t.string :origin_url, null: false
      t.timestamp :expire_at, null: false
      t.integer :view_count, null: false, default: 0
      t.timestamps
      t.index :url_code, unique: true
      t.index :expire_at
    end
  end
end
