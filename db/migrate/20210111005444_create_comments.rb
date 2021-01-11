class CreateComments < ActiveRecord::Migration[6.1]
  def change
    create_table :comments do |t|
      t.references :commentable, polymorphic: true, null: false
      t.string :body
      t.references :user, index: true
      t.timestamps
    end
  end
end
