class CreateNotes < ActiveRecord::Migration[6.0]
  def change
    create_table :notes do |t|
      t.string :text
      t.integer :subcategory_id

      t.timestamps
    end
  end
end
