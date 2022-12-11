class CreateChanges < ActiveRecord::Migration[6.1]
  def change
    create_table :changes do |t|
      t.integer :procedure_id
      #変更された手順のID
      t.integer :user_id
      #変更を記載した利用者ID
      t.text :change
      #変更点本文
      t.text :reason
      #変更理由
      t.timestamps
    end
  end
end
