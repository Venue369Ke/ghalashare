class CreateProperties < ActiveRecord::Migration[5.2]
  def change
    create_table :properties do |t|
      t.references :warehouse, foreign_key: true

      t.timestamps
    end
  end
end
