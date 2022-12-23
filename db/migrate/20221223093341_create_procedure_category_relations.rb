class CreateProcedureCategoryRelations < ActiveRecord::Migration[6.1]
  def change
    create_table :procedure_category_relations do |t|
      #中間テーブル（手順とカテゴリー）

      t.integer :procedure_id
      #手順ID
      t.integer :category_id
      #カテゴリーID
      t.timestamps
    end
  end
end
