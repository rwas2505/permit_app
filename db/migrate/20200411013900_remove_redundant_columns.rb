class RemoveRedundantColumns < ActiveRecord::Migration[6.0]
  def change
    remove_column :cases, :case_id, :integer
    remove_column :installations, :installation_id, :integer
  end
end
