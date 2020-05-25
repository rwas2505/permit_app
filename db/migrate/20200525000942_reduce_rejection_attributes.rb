class ReduceRejectionAttributes < ActiveRecord::Migration[6.0]
  def change
    #keep product, level_reviewed, rejection_source, corrections_uploaded
    #remove category, sub_category, office, state, ahj, note, installation, case
    remove_column :rejections, :category, :string
    remove_column :rejections, :sub_category, :string
    remove_column :rejections, :office, :string
    remove_column :rejections, :state, :string
    remove_column :rejections, :ahj, :string
    remove_column :rejections, :note, :string
    remove_column :rejections, :installation, :integer
    remove_column :rejections, :case, :integer
  end
end
