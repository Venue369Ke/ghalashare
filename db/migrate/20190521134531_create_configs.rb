class CreateConfigs < ActiveRecord::Migration[5.2]
  def change
    create_table :configs do |t|
      t.string :config_item
      t.references :warehouse, foreign_key: true

      t.timestamps
    end
  end
end
