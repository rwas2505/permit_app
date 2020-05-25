class AddJobPrimaryKeyToRejectionModel < ActiveRecord::Migration[6.0]
  def change
    add_column :rejections, :job_id, :integer
  end
end
