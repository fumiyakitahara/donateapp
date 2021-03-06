class CreateSupports < ActiveRecord::Migration[6.0]
  def change
    create_table :supports do |t|
      t.string   :item,          null: false
      t.integer  :price,         null: false
      t.text     :reason,        null: false
      t.text     :status,        null: false
      t.references :user,        foreign_key: true  
      t.timestamps
    end
  end
end
