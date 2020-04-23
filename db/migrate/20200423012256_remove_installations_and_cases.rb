class RemoveInstallationsAndCases < ActiveRecord::Migration[6.0]
  def change
    drop_table :installations
    drop_table :cases
  end
end
