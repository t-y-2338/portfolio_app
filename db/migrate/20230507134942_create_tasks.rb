class CreateTasks < ActiveRecord::Migration[7.0]
  def change
    create_table :tasks do |t|
      t.references :post, foreign_key: true
      t.string :body, null: false

      t.timestamps
    end
  end
end
