class CreateNotes < ActiveRecord::Migration[5.0]
  def change
    create_table :notes do |t|
      t.integer :answer_id
      t.integer :user_id
      t.text :content
      t.boolean :agreement

      t.timestamps
    end
  end
end
