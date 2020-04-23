class RemoveIdFromAttributesInRejections < ActiveRecord::Migration[6.0]
  def change
    rename_column :rejections, :installation_id, :installation
    rename_column :rejections, :case_id, :case
  end
end
