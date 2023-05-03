class CreatePosts < ActiveRecord::Migration[7.0]
  def change
    create_table :posts do |t|
      t.references :user, foreign_key: true
      t.string :title, null: false
      t.text :description
      t.date :due_date
      t.date :done_on

      t.timestamps
    end
  end
end
