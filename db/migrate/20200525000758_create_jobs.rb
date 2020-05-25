class CreateJobs < ActiveRecord::Migration[6.0]
  def change
    create_table :jobs do |t|
      t.integer :installation_id
      t.integer :job_number
      t.string :state
      t.string :ahj
      t.string :ofice

      t.timestamps
    end
  end
end
