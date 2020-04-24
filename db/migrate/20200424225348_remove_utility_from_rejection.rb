class RemoveUtilityFromRejection < ActiveRecord::Migration[6.0]
  def change
    remove_column :rejections, :utility, :string
  end
end
