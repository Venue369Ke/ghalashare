class CreateConnections < ActiveRecord::Migration[5.2]
  def change
    create_table :connections do |t|
      t.string :connection_item
      t.references :warehouse, foreign_key: true

      t.timestamps
    end
  end
end
