class CorrectOfficeSpellingInJobsModel < ActiveRecord::Migration[6.0]
  def change
    rename_column :jobs, :ofice, :office
  end
end
