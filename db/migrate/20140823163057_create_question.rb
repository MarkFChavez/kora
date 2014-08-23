class CreateQuestion < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.column :title, :string
      t.column :body, :text
      t.column :user_id, :integer

      t.timestamps
    end

    add_index :questions, :user_id
  end
end
