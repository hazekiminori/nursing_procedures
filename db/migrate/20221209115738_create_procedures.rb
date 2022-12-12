class CreateProcedures < ActiveRecord::Migration[6.1]
  def change
    create_table :procedures do |t|
      t.integer :user_id
      t.string :title
      t.text :necessities
      t.text :procedure
      t.timestamps
    end
  end
end
