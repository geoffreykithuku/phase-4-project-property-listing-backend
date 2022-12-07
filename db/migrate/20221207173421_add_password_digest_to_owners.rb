class AddPasswordDigestToOwners < ActiveRecord::Migration[7.0]
  def change
    add_column :owners, :password_digest, :string
  end
end
