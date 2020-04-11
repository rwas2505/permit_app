class CreateInstallations < ActiveRecord::Migration[6.0]
  def change
    create_table :installations do |t|
      t.integer :installation_id

      t.timestamps
    end
  end
end
