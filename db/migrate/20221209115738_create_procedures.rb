class CreateProcedures < ActiveRecord::Migration[6.1]
  def change
    create_table :procedures do |t|
      t.integer :user_id
      t.string :title
      t.text :necessity_item
      t.text :body
      t.timestamps
    end
  end
end
