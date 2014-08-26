class CreateRelationship < ActiveRecord::Migration
  def change
    create_table :relationships do |t|
      t.column :user_id, :integer
      t.column :followable_id, :integer
      t.column :followable_type, :string

      t.timestamps
    end
    
    add_index :relationships, :user_id
    add_index :relationships, [:followable_id, :followable_type]
  end
end
