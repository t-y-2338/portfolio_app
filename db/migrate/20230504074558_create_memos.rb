class CreateMemos < ActiveRecord::Migration[7.0]
  def change
    create_table :memos do |t|
      t.references :post, foreign_key: true
      t.references :user, foreign_key: true
      t.text :body, null: false

      t.timestamps
    end
  end
end
