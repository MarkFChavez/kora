class CreateAnswer < ActiveRecord::Migration
  def change
    create_table :answers do |t|
      t.column :body, :text
      t.column :question_id, :integer
      t.column :user_id, :integer

      t.timestamps
    end

    add_index :answers, :question_id
    add_index :answers, :user_id
  end
end
