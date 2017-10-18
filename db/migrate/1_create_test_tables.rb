
class CreateTestTables < ActiveRecord::Migration

  def change
    
    create_table :owners do |t|
      t.string :name
      t.string :age
    end
    
    create_table :kittens do |t|
      t.string :name
      t.string :breed
      t.references :owner
    end
    
  end
  
end