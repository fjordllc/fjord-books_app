class CreateComments < ActiveRecord::Migration[6.1]
  def change
    create_table :comments do |t|
      t.references :commentable, polymorphic: true, null: false
      t.string :body
      t.references :user, index: true ,null: false,foreign_key: true
      t.timestamps
      
    end
  end
end
