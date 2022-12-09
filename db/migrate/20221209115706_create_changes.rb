class CreateChanges < ActiveRecord::Migration[6.1]
  def change
    create_table :changes do |t|
      t.integer :procedure_id
      t.integer :user_id
      t.text :change
      t.text :reason
      t.timestamps
    end
  end
end
