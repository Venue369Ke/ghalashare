class CreateReviews < ActiveRecord::Migration[5.2]
  def change
    create_table :reviews do |t|
      t.text :comment
      t.integer :star, default: 1
      t.references :warehouse, foreign_key: true
      t.references :reservation, foreign_key: true
      t.references :guest, foreign_key: false
      t.references :host, foreign_key: false
      t.string :type

      t.timestamps
    end
    add_foreign_key :reviews, :users, column: :guest_id
    add_foreign_key :reviews, :users, column: :host_id
  end
end
