class CreateFollows < ActiveRecord::Migration[5.0]
  def change
    create_table :follows do |t|
      t.references :user, null: false
      t.references :board, null: false

      t.timestamps
    end
  end
end
