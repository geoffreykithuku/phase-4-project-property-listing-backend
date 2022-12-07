class ChangeUsernameInOwnersToName < ActiveRecord::Migration[7.0]
  def change
    rename_column :owners, :username, :name
  end
end
