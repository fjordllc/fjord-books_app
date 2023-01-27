class AddUserIdToReport < ActiveRecord::Migration[6.1]
  def change
    add_reference :reports, :contributor, foreign_key: { to_table: :users }
  end
end
