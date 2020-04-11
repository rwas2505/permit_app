class CreateCases < ActiveRecord::Migration[6.0]
  def change
    create_table :cases do |t|
      t.integer :case_id 
      t.integer :installation_id
      t.integer :user_id

      t.timestamps
    end
  end
end
