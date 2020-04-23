class AddAndRemoveColumns < ActiveRecord::Migration[6.0]
  def change
    remove_column :rejections, :design_error, :boolean
    remove_column :rejections, :new_ahj_requirement, :boolean
    remove_column :rejections, :sub_queue_name, :string
    add_column :rejections, :level_reviewed, :string
    add_column :rejections, :rejection_source, :string
    add_column :rejections, :corrections_uploaded, :boolean
  end
end
