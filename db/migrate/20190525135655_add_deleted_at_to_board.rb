class AddDeletedAtToBoard < ActiveRecord::Migration[5.0]
  def change
    add_column :boards, :deleted_at, :datetime
    add_index :boards, :deleted_at
  end
end
