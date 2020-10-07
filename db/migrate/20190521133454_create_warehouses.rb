class CreateWarehouses < ActiveRecord::Migration[5.2]
  def change
    create_table :warehouses do |t|
      t.string :title
      t.integer :total_size
      t.text :description
      t.string :youtube_url
      t.references :company, foreign_key: true

      t.timestamps
    end
  end
end
