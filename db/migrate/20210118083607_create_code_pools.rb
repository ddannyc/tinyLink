class CreateCodePools < ActiveRecord::Migration[6.1]
  def change
    create_table :code_pools do |t|

      t.string :code, null: false
      t.boolean :is_use, null: false, default: false
      t.timestamps
    end
  end
end
