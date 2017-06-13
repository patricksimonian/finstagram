class CreateDemoTables < ActiveRecord::Migration

    create_table :lotr_characters do |t|
       t.string :name
       t.integer :age
       t.boolean :has_beard
       t.string :race
       t.string :icon_url
    end


end