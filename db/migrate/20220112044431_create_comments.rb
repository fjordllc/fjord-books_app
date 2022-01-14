class CreateComments < ActiveRecord::Migration[6.1]
  def change
    create_table :comments do |t|
      t.references :commentable, polymophic: true, null: false
      t.string :commentable_type, null: false
      t.text :comment_content

      t.timestamps

    end
  end
end
