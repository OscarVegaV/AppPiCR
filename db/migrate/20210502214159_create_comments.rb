class CreateComments < ActiveRecord::Migration[6.1]
  def change
    create_table :comments do |t|
      t.references :user, null: false, foreign_key: true
      t.text :content
      t.string :commentable_type
      t.integer :commentable_id

      t.timestamps
    end
  end
end
