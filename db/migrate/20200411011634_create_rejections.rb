class CreateRejections < ActiveRecord::Migration[6.0]
  def change
    create_table :rejections do |t|
      t.string :category
      t.string :sub_category
      t.string :sub_queue_name
      t.string :product
      t.string :office
      t.string :state
      t.string :utility
      t.string :ahj
      t.boolean :design_error
      t.boolean :new_ahj_requirement
      t.string :note
      t.integer :case_id
      t.integer :installation_id

      t.timestamps
    end
  end
end
