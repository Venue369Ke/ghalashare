class AddSubaccountToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :subaccount, :string
  end
end
