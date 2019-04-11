class CreateTouchdowns < ActiveRecord::Migration[5.2]
  def change
    create_table :touchdowns do |t|
      t.integer :number
      t.references :player, foreign_key: true
      t.timestamps
    end
  end
end
