class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.string :title, null: false
      t.text :body, null: false
      t.references(:user, index: true)
      t.references(:post, index: true)

      t.timestamps null: false
    end
  end
end
