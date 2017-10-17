
class AddPasswordToOwners < ActiveRecord::Migration

  def change
     add_column :owners, :password, :string
  end
  
end