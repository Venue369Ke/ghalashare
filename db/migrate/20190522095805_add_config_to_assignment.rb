class AddConfigToAssignment < ActiveRecord::Migration[5.2]
  def change
    add_reference :assignments, :config, foreign_key: true
  end
end
